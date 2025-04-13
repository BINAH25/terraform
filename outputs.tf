output "vpc_id" {
  value = module.vpc.terra_demo_proj_vpc_id
}

output "public_subnets" {
  value = module.vpc.terra_demo_proj_public_subnets
}

output "terra_demo_proj_sg_name" {
  value = module.security_group.terra_demo_proj_sg_name

}

output "ec2_public_ip_address" {
  value = module.ec2.terra_demo_proj_ec2_instance

}