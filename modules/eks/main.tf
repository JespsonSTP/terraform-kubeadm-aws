data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "us-west-2"
    bucket = "k8sclass-tf-state"
    key    = "network/terraform.tfstate"
  }
}

locals {
  net_state = data.terraform_remote_state.vpc.outputs.vpc
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_eks_cluster" "cluster" {
  name = "eks-demo-cluster"
  vpc_config {
    subnet_ids = local.net_state.public_subnets
  }
  version  = "1.22"
}

resource "aws_eks_node_group" "nodegroup" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "eks-demo-nodegroup"
  subnet_ids      = local.net_state.public_subnets
  scaling_config {
    desired_size = 2
    max_size     = 6
    min_size     = 1
  }
  instance_types = ["t3.small"]

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}