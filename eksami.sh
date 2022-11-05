#!/bin/bash
echo "This script has been tested on ubuntu 20.4.3 LTS (focal). If you are using another distribution, you most likely need to edit this script."
sleep 3
export DEBIAN_FRONTEND=noninteractive
echo "installing docker"
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

apt-get update && apt-get install docker-ce docker-ce-cli containerd.io -y

sudo usermod -aG docker ubuntu

#Providing full access to docker.sock file
sudo chmod 777 /var/run/docker.sock

#Restarting docker service
sudo service docker restart
systemctl enable docker 


echo "installing kubernetes"
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl

#installing eksctl
curl --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
which eksctl

eksctl version > kubsversions.txt
kubectl version --short --client >> kubsversions.txt