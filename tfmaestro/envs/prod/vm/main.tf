provider "azurerm" {
  features {}
}

module "vm" {
  source                  = "../../../modules/vm"
  resource_group_name     = "${var.environment}-rg"
  resource_group_location = var.location
  vm_config               = var.vm_config
  environment             = var.environment
  network_name            = var.network_name
  firewall_rules          = var.firewall_rules
}
