# Cosmos DB Account with MongoDB API
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "${var.env}-cosmosdb"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "MongoDB"

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  consistency_policy {
    consistency_level = "Session"
  }
}

# Private Endpoint for Cosmos DB
resource "azurerm_private_endpoint" "cosmosdb_endpoint" {
  name                = "${var.env}-cosmosdb-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.cosmosdb_subnet.id

  private_service_connection {
    name                           = "${var.env}-cosmosdb-connection"
    private_connection_resource_id = azurerm_cosmosdb_account.cosmosdb.id
    subresource_names              = ["mongoDB"]
    is_manual_connection = false
  }
}

# Private DNS Zone Linking
resource "azurerm_private_dns_zone_virtual_network_link" "cosmosdb_dns_link" {
  name                  = "${var.env}-cosmosdb-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_cosmosdb_account.cosmosdb.name
  virtual_network_id    = azurerm_virtual_network.cosmosdb_vnet.id
}