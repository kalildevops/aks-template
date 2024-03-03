# Network Security Group
resource "azurerm_network_security_group" "aks_nsg" {
  name                = "${var.env}-aks-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Inbound
resource "azurerm_network_security_rule" "any_443_inbound" {
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
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
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
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}

# Outbound
resource "azurerm_network_security_rule" "any_cosmosdb_outbound" {
  name = "any-cosmosdb-outbound"
  access = "Allow"
  direction = "Outbound"
  priority = 100
  protocol = "Tcp"
  source_address_prefix = "*"
  source_port_range = "*"
  destination_address_prefix  = "*"
  destination_port_range = "443"
  resource_group_name = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}

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
  network_security_group_name = azurerm_network_security_group.aks_nsg.name
}