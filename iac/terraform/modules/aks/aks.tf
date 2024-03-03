resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.env}-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  image_cleaner_enabled = true
  image_cleaner_interval_hours = "24"
  local_account_disabled = false
  role_based_access_control_enabled = true
  sku_tier = var.sku_tier
  workload_identity_enabled = true
  oidc_issuer_enabled = true
  kubernetes_version = var.kubernetes_version
  private_cluster_enabled = false

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
    enable_auto_scaling = true
    enable_node_public_ip = false
    vnet_subnet_id =
    min_count = var.min_count
    max_count = var.max_count
  }

  tags = var.tags
}