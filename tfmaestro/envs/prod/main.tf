resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-rg"
  location = var.location
}
module "vnet" {
  source              = "../../modules/vnet/"
  name                = var.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.address_space
  resource_group_name = azurerm_resource_group.rg.name

  subnets = {
    "prod-subnet-01" = {
      address_prefix = "10.0.1.0/24"
    }
    "prod-subnet-02" = {
      address_prefix = "10.0.2.0/24"
    }
  }
}