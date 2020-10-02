provider "azurerm" {
  version = ">=0.7.0"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"

  region = "${var.az_region}"
  features {}
}

resource "azurerm_resource_group" "application_resource_group" {
  name     = "${var.prefix}-resources"
  location = "${var.az_region}"
}