variable "namespace" {
    type = string
}

variable "vpc_cidr" {
  type = string
}
variable "instance_type" {
  type = string
}
# EKS Cluster Input Variables
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
}

variable "master_instance_type" {
  type = string
}
variable "private_subnet01_netnum" {
  type = string
}
variable "public_subnet01_netnum" {
  type = string
}
variable "worker_instance_type" {
  type = string
}
variable "nodes_max_size" {
  type = number
}
variable "nodes_min_size" {
  type = number
}
variable "aws_key_pair" {
  type = string
}
variable "priv_subnet" {
  type = any
}
variable "pub_subnet" {
  type = any
}
variable "utilities_subnet" {
  type = any
}
variable "vpc" {
  type = any
}
