data "aws_availability_zones" "azs" {}

locals {
  nums = range("${length(data.aws_availability_zones.azs.names)/3}") //range(3)
}

module "vpc" {
  source                = "terraform-aws-modules/vpc/aws"

  name                  = var.vpc_name
  cidr              = var.vpc_cidr

  azs                   = data.aws_availability_zones.azs.names
  private_subnets       = [for i in local.nums : "10.0.${0+i}.0/24" ]
  public_subnets        = [for i in local.nums : "10.0.${100+i}.0/24" ]

  enable_dns_hostnames  = true

  enable_nat_gateway    = true
  single_nat_gateway    = true

  map_public_ip_on_launch = true

  dhcp_options_domain_name = "${var.region}.compute.internal"
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]

  private_subnet_tags = {
    name = "private-subnet01-${var.cluster_name}"
  }
  tags = {
    name = "${var.env[0]}-${var.vpc_name}"
  }
}
