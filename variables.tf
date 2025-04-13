variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr" {
  type = string
}

variable "cidr_public_subnet" {
  type = list(string)
}

variable "cidr_private_subnet" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "vpc_name" {
  type = string
}

variable "map_public_ip_on_launch" {
  type = bool
  default = true
}

variable "security_group_name" {
  type = string
}


variable "security_group_cidr" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

variable "cluster_name" {
  default = "terra-demo-proj-eks-cluster"
}

variable "cluster_version" {
  default = "1.28"
}

variable "node_group_instance_type" {
  default = "t3.micro"
}

variable "desired_capacity" {
  default = 2
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 3
}

variable "eks_tags" {
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

