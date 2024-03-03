# Common
variable "env" {}
variable "resource_group_name" {}
variable "location" {}
variable "tags" {
  type = map(string)
}

# CosmosDB Vnet
variable "cosmosdb_address_space" {} # CIDR /22

# CosmosDB Subnet
variable "cosmosdb_address_prefixes" {} # CIDR /24


