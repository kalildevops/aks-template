# Common
variable "env" {}
variable "resource_group_name" {}
variable "location" {}
variable "tags" {
  type = map(string)
}

# AKS Vnet
variable "aks_address_space" {} # CIDR /22

# AKS Subnet
variable "aks_address_prefixes" {} # CIDR /24

# AKS
variable "dns_prefix" {}
variable "node_count" {}
variable "vm_size" {}
variable "sku_tier" {}
variable "kubernetes_version" {}
variable "min_count" {}
variable "max_count" {}
variable "dns_service_ip" {} # "10.0.0.10"
variable "docker_bridge_cidr" {} # "172.17.0.1/16"

