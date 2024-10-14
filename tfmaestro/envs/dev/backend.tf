terraform {
    backend "azurerm" {
        resource_group_name = "dev-rg"
        storage_account_name = "tfstateenvdev"
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}