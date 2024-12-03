provider "azurerm" {
  features {}
}
module "database" {
  source         = "../../../modules/database"
  admin_username = var.admin_username
  admin_password = var.admin_password
  firewall_rules = var.firewall_rules
}
