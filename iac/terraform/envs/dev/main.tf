module "acr" {
  source              = "../../modules/acr"
  env                 = var.env
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.tags
}