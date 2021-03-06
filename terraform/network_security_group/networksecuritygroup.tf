############### The below module config is defined to create vm related Network security groups. ####################
module "nsg" {
        source = "../../root/modules/network_security_group/"
        security_group_name=format("%s-vm",var.security_group_name)
        resource_name_prefix=var.resource_name_prefix
        resource_group_name=azurerm_resource_group.application_resource_group.name
        az_region="${var.az_region}"
        ipv4_ingress_cidr_block=["10.0.0.0/8"]
        custom_irules = "${var.custom_irules}"
        create_sg = length(var.custom_irules) > 0 ? true : false
        standard_tags = var.standard_tags
        custom_tags = var.custom_tags
        custom_irules_source = var.custom_irules_source
}