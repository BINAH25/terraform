region              = "eu-west-1"
vpc_cidr            = "11.0.0.0/16"
vpc_name            = "terra-demo-proj-eu-west-vpc"
cidr_public_subnet  = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet = ["11.0.3.0/24", "11.0.4.0/24"]
availability_zones  = ["eu-west-1a", "eu-west-1b"]
security_group_name = "terra-demo-proj-security-group"
security_group_cidr = "0.0.0.0/0"

# EC2 VARIABLES
instance_name = "terra-demo-ec2"
key_name      = "lamp-stack"