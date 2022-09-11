output "data_storage_connection_string" {
  value = azurerm_storage_account.data.primary_connection_string
  sensitive = true
}

 