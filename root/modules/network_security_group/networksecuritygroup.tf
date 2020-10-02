resource "azurerm_network_security_group" "nsg" {
    count=var.create_sg ? 1 : 0
    name = format("%s-%s-%s",var.resource_name_prefix,var.security_group_name,"${random_string.sg_rstring[count.index].result}")
    tags = merge (
            { "Name" = format("%s-%s-%s",var.resource_name_prefix,var.security_group_name,"${random_string.sg_rstring[count.index].result}") },
            var.standard_tags,
            var.custom_tags,
        )
    resource_group_name=var.resource_group_name
    location=var.az_region
}

resource "azurerm_network_security_rule" "custom_rules" {
    count = var.create_sg ? length(var.custom_irules) : 0
    name = lookup(var.custom_irules[count.index],"name",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][4],)
    priority = lookup(var.custom_irules[count.index],"priority", 4096 - length(var.custom_irules) + count.index)
    direction  = lookup(var.custom_irules[count.index],"direction",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][6], )
    access  = lookup(var.custom_irules[count.index],"access",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][7],)
    network_security_group_name = azurerm_network_security_group.nsg[0].name
    #source_address_prefix  = length(lookup(var.custom_irules[count.index], "source_application_security_group_ids", [])) == 0 ? lookup(var.custom_irules[count.index], "source_address_prefix", "*") : ""
    #destination_address_prefix = length(lookup(var.custom_irules[count.index], "destination_application_security_group_ids", [])) == 0 ? lookup(var.custom_irules[count.index], "destination_address_prefix", "*") : ""
    source_address_prefix = "*"
    destination_address_prefix = "*"
    description = lookup(var.custom_irules[count.index],"description","Default Automated Splunk Ingress Rule description")
    source_port_ranges = split(",", replace(lookup(var.custom_irules[count.index], "from_port", "*"), "*", "0-65535"))
    destination_port_ranges = split(",", replace(lookup(var.custom_irules[count.index], "to_port", "*"), "*", "0-65535"))
    protocol = lookup(var.custom_irules[count.index],"protocol",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][3],)

    resource_group_name=var.resource_group_name
}

 

resource "azurerm_network_security_rule" "custom_source_rules" {
    count = var.create_sg ? length(var.custom_irules_source) : 0
    name = lookup(var.custom_irules_source[count.index],"name",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][4],)
    priority = lookup(var.custom_irules_source[count.index],"priority", 4096 - length(var.custom_irules) + count.index)
    direction  = lookup(var.custom_irules_source[count.index],"direction",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][6],)
    access  = lookup(var.custom_irules_source[count.index],"access",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][7],)
    #source_address_prefix  = length(lookup(var.custom_irules[count.index], "source_application_security_group_ids", [])) == 0 ? lookup(var.custom_irules[count.index], "source_address_prefix", "*") : ""
    #source_address_prefix  = length(lookup(var.custom_irules[count.index], "source_application_security_group_ids", [])) == 0 ? lookup(var.custom_irules[count.index], "source_address_prefix", "*") : ""
    #destination_address_prefix = length(lookup(var.custom_irules[count.index], "destination_application_security_group_ids", [])) == 0 ? lookup(var.custom_irules[count.index], "destination_address_prefix", "*") : ""
    source_address_prefix = "*"
    destination_address_prefix = "*"
    description = lookup(var.custom_irules_source[count.index],"description","Default Automated Splunk Ingress Rule description")
    source_port_ranges = split(",", replace(lookup(var.custom_irules[count.index], "from_port", "*"), "*", "0-65535")) 
    destination_port_ranges = split(",", replace(lookup(var.custom_irules[count.index], "to_port", "*"), "*", "0-65535")) 
    protocol = lookup(var.custom_irules_source[count.index],"protocol",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][3],)
 
    network_security_group_name = azurerm_network_security_group.nsg[0].name
    resource_group_name=var.resource_group_name
}

 

resource "random_string" "sg_rstring" {
    count = var.create_sg ? 1 : 0
    length = var.rstring_length
    upper = var.rstring_upper
    lower = var.rstring_lower
    number = var.rstring_number
    special = false
}

 