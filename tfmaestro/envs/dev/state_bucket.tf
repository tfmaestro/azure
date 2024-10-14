module "terraform_state_bucket" {
  source              = "../../modules/terraform_state_bucket"
  environment         = var.environment
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  log_container_name  = "tfstate-logs-${var.environment}"
}