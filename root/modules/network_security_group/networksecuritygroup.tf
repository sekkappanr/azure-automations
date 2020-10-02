resource "azurerm_network_security_group" "nsg" {
    count=var.create_sg ? 1 : 0
    name = format("%s-%s-%s",var.resource_name_prefix,var.security_group_name,"${random_string.sg_rstring[count.index].result}")
    description = "Automated ec2 security group generated via Terraform automation tool"
    tags = merge (
            { "Name" = format("%s-%s-%s",var.resource_name_prefix,var.security_group_name,"${random_string.sg_rstring[count.index].result}") },
            var.standard_tags,
            var.custom_tags,
        )
}

resource "azurerm_network_security_rule" "custom_rules" {
    count = var.create_sg ? length(var.custom_irules) : 0
    name = lookup(var.custom_irules[count.index],"name",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][4],)
    priority = lookup(var.custom_irules[count.index],"priority",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][5],)
    direction  = lookup(var.custom_irules[count.index],"direction",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][6], Any)
    access  = lookup(var.custom_irules[count.index],"access",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][7],)
    network_security_group_name = azurerm_network_security_group.nsg[0].name
    ource_address_prefix = length(lookup(var.custom_irules[count.index], "source_application_security_group_ids", [])) == 0 ? join(",", var.cidr_block) : ""
    description = lookup(var.custom_irules[count.index],"description","Default Automated Splunk Ingress Rule description")
    source_port_ranges = lookup(var.custom_irules[count.index],"from_port",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][1],)
    destination_port_ranges = lookup(var.custom_irules[count.index],"to_port",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][2],)
    protocol = lookup(var.custom_irules[count.index],"protocol",var.internal_rules[lookup(var.custom_irules[count.index],"rule","none")][3],)
}

 

resource "aws_security_group_rule" "custom_source_rules" {
    count = var.create_sg ? length(var.custom_irules_source) : 0
    name = lookup(var.custom_irules_source[count.index],"name",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][4],)
    priority = lookup(var.custom_irules_source[count.index],"priority",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][5],)
    direction  = lookup(var.custom_irules_source[count.index],"direction",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][6], Any)
    access  = lookup(var.custom_irules_source[count.index],"access",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][7],)
    network_security_group_name = azurerm_network_security_group.nsg[0].name
    description = lookup(var.custom_irules_source[count.index],"description","Default Automated Splunk Ingress Rule description")
    source_port_ranges = lookup(var.custom_irules_source[count.index],"from_port",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][1],)
    destination_port_ranges = lookup(var.custom_irules_source[count.index],"to_port",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][2],)
    protocol = lookup(var.custom_irules_source[count.index],"protocol",var.internal_rules[lookup(var.custom_irules_source[count.index],"rule","none")][3],)
    source_application_security_group_ids = lookup(var.custom_irules_source[count.index],"source_sg_id",null)
}

 

resource "random_string" "sg_rstring" {
    count = var.create_sg ? 1 : 0
    length = var.rstring_length
    upper = var.rstring_upper
    lower = var.rstring_lower
    number = var.rstring_number
    special = false
}

 