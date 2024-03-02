terraform {
  backend "azurerm" {
    resource_group_name  = "rg-dev"
    storage_account_name = "tfstatedev20240301"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}