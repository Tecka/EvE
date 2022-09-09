terraform {
  backend "azurerm" {
    resource_group_name  = "RG-EVE-01-P"
    storage_account_name = "staeveqy5lo01p"
    container_name       = "statefiles"
    key                  = "egg.prod.tfstate"
  }
}