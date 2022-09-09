resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = local.location
}

resource "azurerm_storage_account" "remote_backends" {
  name                     = local.remote_backends_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    role = "remote_backends"
  }
}

resource "azurerm_storage_container" "statefiles" {
  name                 = "statefiles"
  storage_account_name = azurerm_storage_account.remote_backends.name
  //container_access_type = "private"
}