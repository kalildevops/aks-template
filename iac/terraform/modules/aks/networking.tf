# Vnet
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.env}-vnet"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.env}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
}

# Public IP
resource "azurerm_public_ip" "aks_public_ip" {
  name                = "${var.env}-aks-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}