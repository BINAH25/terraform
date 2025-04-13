variable "vpc_id" {
  type    = string
  default = "vpc id"
}

variable "security_group_name" {
  type        = string
  description = "name of the security group"
}


variable "security_group_cidr" {
  type        = string
  description = "cidr for the security group"
}