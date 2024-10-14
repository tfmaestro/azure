resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-rg"
  location = var.location
}

module "vnet" {
  source              = "../../modules/vnet/"
  name                = var.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg.name

  subnets = {
    "dev-subnet-01" = {
      address_prefix = "10.0.3.0/24"
    }
    "dev-subnet-02" = {
      address_prefix = "10.0.4.0/24"
    }
  }
}