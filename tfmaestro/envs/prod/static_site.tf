module "bucket" {
  source              = "../../modules/bucket"
  name                = "tfmaestromaintenance"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  main_page_suffix    = "index.html"
  not_found_page      = "404.html"
}
