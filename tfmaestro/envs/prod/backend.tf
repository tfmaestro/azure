terraform {
    backend "azurerm" {
        resource_group_name = "prod-rg"
        storage_account_name = "tfstateenvprod"
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}