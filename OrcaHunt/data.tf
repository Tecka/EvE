resource "azurerm_storage_account" "data" {
  name                     = local.data_name
  resource_group_name      = local.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    role = "data"
  }
}

resource "azurerm_storage_table" "regions" {
  name                 = "regions"
  storage_account_name = azurerm_storage_account.data.name
}

resource "azurerm_storage_table" "contracts" {
  name                 = "contracts"
  storage_account_name = azurerm_storage_account.data.name
}