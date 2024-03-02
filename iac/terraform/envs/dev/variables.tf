locals {
  tags = {
    "env" : "dev"
    "creation" : "Terraform"
  }
}

# ACR
variable "env" {}
variable "resource_group_name" {}
variable "location" {}