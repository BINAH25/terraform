variable "cluster_name" {
    type = string
    description = "name of the eks clust"
}
variable "cluster_version" {
    type = string
    description = "version the cluster"
}
variable "vpc_id" {
    type = string
    description = "id of the vpc"
}
variable "subnet_ids" {
  type = list(string)
  description = "cidr block list of subnet in which eks would be"
}
variable "node_group_instance_type" {
    type = string
    description = "instance type of node group"
}

variable "desired_capacity" {
    type = number
    description = "desired node capacity"
}
variable "min_size" {
    type = number
    description = "minimun number of nodes"
}
variable "max_size" {
    type = number
    description = "maximum of nodes"
}

variable "eks_tags" {
  type = map(string)
  default = {}
}
