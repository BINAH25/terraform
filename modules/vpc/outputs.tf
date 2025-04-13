output "terra_demo_proj_vpc_id" {
  value = aws_vpc.terra_demo_proj_vpc.id

}

output "terra_demo_proj_public_subnets" {
  value = aws_subnet.terra_demo_proj_public_subnet.*.id
}