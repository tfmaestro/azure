resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-rg"
  location = var.location
}
module "vnet" {
  source                  = "../../modules/vnet/"
  name                    = var.name
  location                = azurerm_resource_group.rg.location
  address_space           = var.address_space
  resource_group_name     = azurerm_resource_group.rg.name
  private_subnets         = var.private_subnets
  public_subnets          = var.public_subnets
  public_database_subnets = var.public_database_subnets
}
