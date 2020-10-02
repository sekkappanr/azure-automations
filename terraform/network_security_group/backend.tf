terraform {
    backend "azurerm" {
        resource_group_name = "terraform-state"
        storage_account_name = "managetfstatefile"
        container_name = "terraformstate"
        key = "terraform.tfstate"
    }
}