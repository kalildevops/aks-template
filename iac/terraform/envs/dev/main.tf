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
  source              = "../../modules/cosmosdb"
  env                 = var.env
  resource_group_name = var.resource_group_name
  location            = var.location
  cosmosdb_address_space = var.cosmosdb_address_space
  cosmosdb_address_prefixes = var.cosmosdb_address_prefixes
  tags                = var.tags
}