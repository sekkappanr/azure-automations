# Configure the Azure provider
provider "azurerm" {
    version = "~>1.32.0"
    use_msi = true
    subscription_id = "2720979b-7976-4d8b-b3a4-17d451a9f460"
    tenant_id       = "e0793d39-0939-496d-b129-198edd916feb"
}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
    name     = "MySekkTFRG"
    location = "australiaeast"
}

