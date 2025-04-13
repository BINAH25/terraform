terraform {
  backend "s3" {
    bucket       = "terraform-script-tf-state"
    key          = "terraform/terraform.tfstate"
    region       = "eu-west-1"
    encrypt      = true
    use_lockfile = true
  }
}