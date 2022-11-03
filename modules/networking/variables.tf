variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}

variable "vpc_name" {
  type = string
}
variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}
variable "utilities_subnet" {
  type = any
}
variable "pub_subnet" {
  type = any
}

variable "env" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}
