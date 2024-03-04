# Cosmos DB Account with MongoDB API
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "${var.env}-cosmosdb-202403030603"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "MongoDB"
  public_network_access_enabled = true
  is_virtual_network_filter_enabled = true
  virtual_network_rule {
    id = azurerm_subnet.cosmosdb_subnet.id
  }

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

  tags = var.tags
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

# Create DNS Zone
resource "azurerm_private_dns_zone" "cosmosdb_dns_zone" {
  name                = "${var.env}.cosmosdb.local"
  resource_group_name = var.resource_group_name
}

# Private DNS Zone Linking
resource "azurerm_private_dns_zone_virtual_network_link" "cosmosdb_dns_link" {
  name                  = "${var.env}-cosmosdb-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.cosmosdb_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.cosmosdb_vnet.id
}