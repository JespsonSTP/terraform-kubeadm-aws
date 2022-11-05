data "aws_availability_zones" "available" {}


module "vpc" {
  source                = "terraform-aws-modules/vpc/aws"

  name                  = var.vpc_name
  cidr                  = var.vpc_cidr

  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_nat_gateway   = true

  enable_dns_hostnames  = true
  single_nat_gateway    = true

  map_public_ip_on_launch = true

  dhcp_options_domain_name = "${var.region}.compute.internal"
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
  tags = {
    name = "${var.env[0]}-${var.vpc_name}"
  }
}
