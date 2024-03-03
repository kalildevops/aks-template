# Common
variable "env" {}
variable "resource_group_name" {}
variable "location" {}
variable "tags" {
  type = map(string)
}

# Vnet
variable "address_space" {} # CIDR /22

# Subnet
variable "address_prefixes" {} # CIDR /24

# NSG

# AKS
variable "dns_prefix" {}
variable "node_count" {}
variable "vm_size" {}
variable "sku_tier" {}
variable "kubernetes_version" {}
variable "min_count" {}
variable "max_count" {}
