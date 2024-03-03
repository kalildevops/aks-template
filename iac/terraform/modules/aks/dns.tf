resource "azurerm_dns_zone" "aks_dns_zone" {
  name                = "${var.env}aks.local"
  resource_group_name = var.resource_group_name
}

resource "azurerm_dns_a_record" "api_dns_record" {
  name                = "api"
  zone_name           = azurerm_dns_zone.aks_dns_zone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = ["${azurerm_public_ip.aks_public_ip.ip_address}"]
}
