terraform {
    backend "azurerm" {
        resource_group_name = "${var.rg_tf_state}"
        storage_account_name = "${var.storage_tf_state}"
        container_name = "${var.container_tf_state}"
        location = "${var.az_region}"
    }
}