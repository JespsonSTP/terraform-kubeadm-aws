resource "aws_subnet" "utility" {
  vpc_id                  = module.vpc.vpc_id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.3.0/24"
  availability_zone       = element(data.aws_availability_zones.azs.names, 1)
  tags = {
    Name = "utility"
  }
}