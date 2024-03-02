locals {
  tags = {
    "env" : "dev"
    "creation" : "Terraform"
  }
}

variable "env" {}
variable "resource_group_name" {}
variable "location" {}
