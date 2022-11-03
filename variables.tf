variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}

variable "vpc_cidr" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "region" {
  type = string
}
variable "bucket" {
  type = string
}
variable "key" {
  type = string
}
variable "dynamodb_table" {
  type = string
}

variable "env" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}
variable "instance_type" {
  type = string
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
