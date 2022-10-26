#creating security group
resource "aws_security_group" "eks_workergp_mngnt_sg" {
  name = "eks_workergp_mngnt_sg"
  description = "this is the security group for eks worker group"
  vpc_id = 

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    "Name"="eks_workergp_mngnt_sg"
  }
}