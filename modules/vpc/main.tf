# Create VPC
resource "aws_vpc" "terra_demo_proj_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }

}

# Create public subnet
resource "aws_subnet" "terra_demo_proj_public_subnet" {
  count             = length(var.cidr_public_subnet)
  vpc_id            = aws_vpc.terra_demo_proj_vpc.id
  cidr_block        = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.availability_zones, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "terra-demo-proj-public-subnet-${count.index + 1}"
  }

}

# Create private subnet
resource "aws_subnet" "terra_demo_proj_private_subnet" {
  count             = length(var.cidr_private_subnet)
  vpc_id            = aws_vpc.terra_demo_proj_vpc.id
  cidr_block        = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "terra-demo-proj-private-subnet-${count.index + 1}"
  }

}
# Create internet gateway
resource "aws_internet_gateway" "terra_demo_proj_internet_gateway" {
  vpc_id = aws_vpc.terra_demo_proj_vpc.id

  tags = {
    Name = "terra-demo-proj-internet-gateway"
  }

}
# create public route table
resource "aws_route_table" "terra_demo_proj_public_route_table" {
  vpc_id = aws_vpc.terra_demo_proj_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_demo_proj_internet_gateway.id
  }

  tags = {
    Name = "terra-demo-proj-public-rt"
  }
}
# Public Route Table and Public Subnet Association
resource "aws_route_table_association" "terra_demo_proj_public_rt_subnet_association" {
  count          = length(aws_subnet.terra_demo_proj_public_subnet)
  subnet_id      = aws_subnet.terra_demo_proj_public_subnet[count.index].id
  route_table_id = aws_route_table.terra_demo_proj_public_route_table.id
}

# create private route table
resource "aws_route_table" "terra_demo_proj_private_route_table" {
  vpc_id = aws_vpc.terra_demo_proj_vpc.id

  tags = {
    Name = "terra-demo-proj-private-rt"
  }
}
# Public Route Table and Public Subnet Association
resource "aws_route_table_association" "terra_demo_proj_private_rt_subnet_association" {
  count          = length(aws_subnet.terra_demo_proj_private_subnet)
  subnet_id      = aws_subnet.terra_demo_proj_private_subnet[count.index].id
  route_table_id = aws_route_table.terra_demo_proj_private_route_table.id
}