# create security group
resource "aws_security_group" "terra_demo_proj_sg" {
  name        = var.security_group_name
  description = "Enable the Port 22(SSH) & Port 80(http)"
  vpc_id      = var.vpc_id

  tags = {
    Name = "terra-demo-project-security-group"
  }
}

# create ingress rule
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  description       = "Allow remote HTTP from anywhere"
  security_group_id = aws_security_group.terra_demo_proj_sg.id
  cidr_ipv4         = var.security_group_cidr
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "Security Groups to allow HTTP(80)"
  }
}
# create ingress rule
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  description       = "Allow remote SSH from anywhere"
  security_group_id = aws_security_group.terra_demo_proj_sg.id
  cidr_ipv4         = var.security_group_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "Security Groups to allow SSH(22)"
  }
}

# create egress rule
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.terra_demo_proj_sg.id
  cidr_ipv4         = var.security_group_cidr
  ip_protocol       = "-1"

  tags = {
    Name = "Allow all outbound"
  }
}
