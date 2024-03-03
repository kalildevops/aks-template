# Common
env                 = "dev"
resource_group_name = "rg-dev"
location            = "eastus"

tags = {
  env      = "dev"
  creation = "Terraform"
}

# AKS Vnet
aks_address_space = "10.0.4.0/22"

# AKS Subnet
aks_address_prefixes = ["10.0.1.0/24"]

# AKS
dns_prefix         = "devaks"
node_count         = 1
vm_size            = "Standard_D2as_v4"
sku_tier           = "Free"
kubernetes_version = "1.27.9"
min_count          = 1
max_count          = 2
dns_service_ip     = "10.0.0.10"

# CosmosDB
cosmosdb_address_space    = ["10.1.0.0/22"] # 10.1.0.1 - 10.1.3.254 
cosmosdb_address_prefixes = ["10.1.0.0/24"] # 10.1.0.1 - 10.1.0.254
