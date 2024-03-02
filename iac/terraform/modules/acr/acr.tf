resource "azurerm_container_registry" "acr" {
  name                = "acr${var.env}sample"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = false

  }
  tags = local.tags
}