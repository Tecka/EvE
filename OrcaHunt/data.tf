data "azurerm_client_config" "current" {}

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

resource "azurerm_key_vault" "kva" {
  name                        = local.kva_name
  location                    = var.location
  resource_group_name         = local.rg_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id //(Required) The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies.
    key_permissions = [
      "Get",
    ]
    secret_permissions = [
      "Get",
    ]
    storage_permissions = [
      "Get",
    ]
  }
}



resource "azurerm_service_plan" "asp" {
  name                = local.asp_name
  resource_group_name = local.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "Y1" //Elastic and Consumption SKUs (Y1, EP1, EP2, and EP3) are for use with Function Apps.
}

resource "azurerm_linux_function_app" "afa" {
  name                = local.azf_name
  resource_group_name = local.rg_name
  location            = var.location

  storage_account_name       = azurerm_storage_account.data.name
  storage_account_access_key = azurerm_storage_account.data.primary_access_key
  service_plan_id            = azurerm_service_plan.asp.id

  site_config {}
}

/*
resource "azurerm_storage_table" "regions" {
  name                 = "regions"
  storage_account_name = azurerm_storage_account.data.name
}

resource "azurerm_storage_table" "contracts" {
  name                 = "contracts"
  storage_account_name = azurerm_storage_account.data.name
}
*/