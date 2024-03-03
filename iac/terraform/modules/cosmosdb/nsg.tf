# Network Security Group
resource "azurerm_network_security_group" "cosmosdb_nsg" {
  name                = "${var.env}-cosmosdb-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Inbound
resource "azurerm_network_security_rule" "aks_to_cosmosdb_inbound" {
  name = "any-443-inbound"
  access = "Allow"
  direction = "Inbound"
  priority = 100
  protocol = "Tcp"
  source_address_prefix = azurerm_subnet.cosmosdb_subnet.address_prefixes[0]
  source_port_range = "*"
  destination_address_prefix = azurerm_private_endpoint.cosmosdb_endpoint.private_service_connection.0.private_connection_resource_id
  destination_port_range = "443"
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.cosmosdb_nsg.name
}

resource "azurerm_network_security_rule" "deny_all_inbound" {
  name = "deny-all-inbound"
  access = "Deny"
  direction = "Inbound"
  priority = 300
  protocol = "*"
  source_address_prefix = "*"
  source_port_range = "*"
  destination_address_prefix = "*"
  destination_port_range = "*"
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.cosmosdb_nsg.name
}

# Outbound
resource "azurerm_network_security_rule" "deny_all_outbound" {
  name = "deny-all-outbound"
  access = "Deny"
  direction = "Outbound"
  priority = 300
  protocol = "*"
  source_address_prefix = "*"
  source_port_range = "*"
  destination_address_prefix = "*"
  destination_port_range = "*"
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.cosmosdb_nsg.name
}