resource "azurerm_storage_account" "static_site" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.name

  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = true

  static_website {
    index_document     = var.main_page_suffix
    error_404_document = var.not_found_page
  }
}

resource "azurerm_storage_blob" "index_html" {
  name                   = var.main_page_suffix
  storage_account_name   = azurerm_storage_account.static_site.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "${path.module}/files/index.html"
}

resource "azurerm_storage_blob" "not_found_page_404_html" {
  name                   = var.not_found_page
  storage_account_name   = azurerm_storage_account.static_site.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "${path.module}/files/404.html"
}
