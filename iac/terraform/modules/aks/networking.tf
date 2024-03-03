# Vnet
resource "azurerm_virtual_network" "aks_vnet" {
  name                = "${var.env}-aks-vnet"
  address_space       = var.aks_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Subnet
resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.env}-aks-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = var.aks_address_prefixes
}

# Public IP
resource "azurerm_public_ip" "aks_public_ip" {
  name                = "${var.env}-aks-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# Route Table
resource "azurerm_route_table" "aks_route_table" {
  name                = "${var.env}-aks-route-table"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Route: Internet
resource "azurerm_route" "internet_route" {
  name                = "InternetRoute"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.aks_route_table.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

# Route Association
resource "azurerm_subnet_route_table_association" "subnet_route_association" {
  subnet_id      = azurerm_subnet.aks_subnet.id
  route_table_id = azurerm_route_table.aks_route_table.id
}
