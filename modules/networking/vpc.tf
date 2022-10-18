locals {
  region = "us-east-1"
}

module "vpc_example_simple-vpc" {
  source           = "terraform-aws-modules/vpc/aws"
  version          = "3.14.0"
  name             = "CheffappVPC"
  cidr             = "10.0.0.0/16"
  azs              = ["${local.region}a", "${local.region}b"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]
  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]
  
  enable_dns_hostnames = true
  enable_dns_support = true
  
  enable_ipv6 = false

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "JespAdmin"
    Environment = "production"
  }

  vpc_tags = {
    Name = "chefapp"
  }
}
