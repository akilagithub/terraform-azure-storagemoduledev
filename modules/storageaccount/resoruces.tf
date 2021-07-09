resource "azurerm_resource_group" "akila-rg1" {
  name     = var.resourcegroup
  location = "Central India"
}

resource "azurerm_storage_account" "akila-sa" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.akila-rg1.name
  location                 = azurerm_resource_group.akila-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "akila-sc" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.akila-sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "akilablob" {
  name                   = "akilablob"
  storage_account_name   = azurerm_storage_account.akila-sa.name
  storage_container_name = azurerm_storage_container.akila-sc.name
  type                   = "Block"
  source                 = "C:/AzureTerraform/Demo5Modules/modules/storageaccount/Demo.zip"
}