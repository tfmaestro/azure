provider "azurerm" {
  features {}
}

module "lb" {
  source              = "../../../modules/lb"
  location            = var.location
}