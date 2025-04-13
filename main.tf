module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  cidr_public_subnet  = var.cidr_public_subnet
  cidr_private_subnet = var.cidr_private_subnet
  vpc_name            = var.vpc_name
  availability_zones  = var.availability_zones
  map_public_ip_on_launch = var.associate_public_ip_address
}

module "security_group" {
  source              = "./modules/security-groups"
  security_group_cidr = var.security_group_cidr
  security_group_name = var.security_group_name
  vpc_id              = module.vpc.terra_demo_proj_vpc_id
}


module "ec2" {
  source                      = "./modules/ec2"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = module.vpc.terra_demo_proj_public_subnets[0]
  security_group_ids          = [module.security_group.terra_demo_proj_sg_name]
  instance_name               = var.instance_name
  associate_public_ip_address = var.associate_public_ip_address
  user_data_install_docker    = file("./scripts/docker_install.sh")

}

module "eks" {
  source                   = "./modules/eks"
  cluster_name             = var.cluster_name
  cluster_version          = var.cluster_version
  vpc_id                   = module.vpc.terra_demo_proj_vpc_id
  subnet_ids               = module.vpc.terra_demo_proj_public_subnets
  node_group_instance_type = var.node_group_instance_type
  desired_capacity         = var.desired_capacity
  min_size                 = var.min_size
  max_size                 = var.max_size
  eks_tags                 = var.eks_tags
}

