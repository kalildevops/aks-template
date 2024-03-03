# Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.env}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Inbound
resource "azurerm_network_security_rule" "any-443-inbound" {
  name = "any-443-inbound"
  access = "Allow"
  direction = "Inbound"
  priority = 100
  protocol = "Tcp"
  source_address_prefix = "*"
  source_port_range = "*"
  destination_address_prefix = "*"
  destination_port_range = "443"
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "deny-all-inbound" {
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
  network_security_group_name = azurerm_network_security_group.nsg.name
}

# Outbound
resource "azurerm_network_security_rule" "any-cosmosdb-outbound" {
  name = "any-cosmosdb-outbound"
  access = "Allow"
  direction = "Outbound"
  priority = 100
  protocol = "Tcp"
  source_address_prefix = "*"
  source_port_range = "*"
  destination_address_prefix  = azurerm_cosmosdb_account.cosmosdb.endpoint
  destination_port_range = "443"
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "deny-all-outbound" {
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
  network_security_group_name = azurerm_network_security_group.nsg.name
}