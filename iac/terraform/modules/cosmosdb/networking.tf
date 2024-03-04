# Vnet
resource "azurerm_virtual_network" "cosmosdb_vnet" {
  name                = "${var.env}-cosmosdb-vnet"
  address_space       = var.cosmosdb_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Subnet
resource "azurerm_subnet" "cosmosdb_subnet" {
  name                 = "${var.env}-cosmosdb-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.cosmosdb_vnet.name
  address_prefixes     = var.cosmosdb_address_prefixes
  service_endpoints    = ["Microsoft.AzureCosmosDB"]
}

# Route Table
resource "azurerm_route_table" "cosmosdb_route_table" {
  name                = "${var.env}-cosmosdb-route-table"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Route: Internet
resource "azurerm_route" "internet_route" {
  name                = "InternetRoute"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.cosmosdb_route_table.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

# Route Association
resource "azurerm_subnet_route_table_association" "subnet_route_association" {
  subnet_id      = azurerm_subnet.cosmosdb_subnet.id
  route_table_id = azurerm_route_table.cosmosdb_route_table.id
}
