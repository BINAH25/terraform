output "terra_demo_proj_ec2_instance" {
  value = aws_instance.terra_demo_proj_ec2.public_ip
}