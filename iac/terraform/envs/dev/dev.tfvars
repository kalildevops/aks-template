# Common
env                 = "dev"
resource_group_name = "rg-dev"
location            = "eastus"

tags = {
  env = "dev"
  creation = "Terraform"
}

# CosmosDB
cosmosdb_address_space = ["10.1.0.0/22"]    # 10.1.0.1 - 10.1.3.254 
cosmosdb_address_prefixes = ["10.1.0.0/24"] # 10.1.0.1 - 10.1.0.254


