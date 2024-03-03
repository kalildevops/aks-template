# ACR
module "acr" {
  source              = "../../modules/acr"
  env                 = var.env
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# CosmosDB
module "cosmosdb" {
  source                    = "../../modules/cosmosdb"
  env                       = var.env
  resource_group_name       = var.resource_group_name
  location                  = var.location
  cosmosdb_address_space    = var.cosmosdb_address_space
  cosmosdb_address_prefixes = var.cosmosdb_address_prefixes
  tags                      = var.tags
}

# AKS
module "aks" {
  source               = "../../modules/aks"
  env                  = var.env
  resource_group_name  = var.resource_group_name
  location             = var.location
  aks_address_space    = var.aks_address_space
  aks_address_prefixes = var.aks_address_prefixes
  dns_prefix           = var.dns_prefix
  node_count           = var.node_count
  vm_size              = var.vm_size
  sku_tier             = var.sku_tier
  kubernetes_version   = var.kubernetes_version
  min_count            = var.min_count
  max_count            = var.max_count
  dns_service_ip       = var.dns_service_ip
  docker_bridge_cidr   = var.docker_bridge_cidr
  tags                 = var.tags
}