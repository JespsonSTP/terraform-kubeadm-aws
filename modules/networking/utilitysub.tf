resource "aws_subnet" "utility" {
  vpc_id                  = module.vpc.vpc_id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.7.0/24"
  availability_zone       = element(data.aws_availability_zones.available.names, 1)
  tags = {
    Name = "utility"
  }
}

resource "aws_route_table_association" "utilityass" {
  subnet_id = aws_subnet.utility.id
  route_table_id = var.pubroutid
}

