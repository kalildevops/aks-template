resource "azurerm_container_registry" "acr" {
  name                = "acr${var.env}sample2024"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true
  tags = var.tags
}