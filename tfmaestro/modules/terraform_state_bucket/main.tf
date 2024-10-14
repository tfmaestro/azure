resource "azurerm_storage_account" "tfstate" {
  name                            = "tfstateenv${var.environment}"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = var.environment
    purpose     = "terraform-state"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_container" "log_container" {
  name                  = var.log_container_name
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = var.container_access_type
}
