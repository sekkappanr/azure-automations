terraform {
    required_version = ">=0.12"
}

data "azurerm_image" "tfd_image" {
     name_regex = format("%s*",var.image_regex)
     resource_group_name=var.resource_group_name
}

resource "azurerm_lb" "tf_lb" {
    count = var.enable_load_balancer == true && var.load_balancer_type == "public" ? 1 : 0
    name                = length(format("%s%s-%s",var.resource_name_prefix[3],var.resource_name_tag,random_string.lb_rstring[count.index].result)) > 32 ? substr(format("%s%s-%s",var.resource_name_prefix[3],var.resource_name_tag,random_string.elb_rstring[count.index].result),0,31) : format("%s%s-%s",var.resource_name_prefix[3],var.resource_name_tag,random_string.lb_rstring[count.index].result)
    location            = var.az_location
    resource_group_name = var.resource_group_name
    sku                 = var.load_balancer_sku
    tags                = merge({ "ResourceName" = var.load_balancer_type == "public" ? lower("lbext-${var.resource_name_tag}-${data.azurerm_resource_group.az_resource_group.location}") : lower("lbint-${var.vmscaleset_name}-${data.azurerm_resource_group.az_resource_group.location}") }, var.tags, )

    frontend_ip_configuration {
        name                          = var.load_balancer_type == "public" ? lower("lbext-frontend-${var.resource_name_prefix[0]}") : lower("lbint-frontend-${var.resource_name_prefix[0]}")

        public_ip_address_id          = var.enable_load_balancer == true && var.load_balancer_type == "public" ? azurerm_public_ip.pip[count.index].id : null

        private_ip_address_allocation = var.load_balancer_type == "private" ? var.private_ip_address_allocation : null
        private_ip_address            = var.load_balancer_type == "private" && var.private_ip_address_allocation == "Static" ? var.lb_private_ip_address : null

        subnet_id                     = var.load_balancer_type == "private" ? data.azurerm_subnet.az_subnet.id : null
    }
}


#---------------------------------------
# Create Backend address pool for Load Balancer
#---------------------------------------
resource "azurerm_lb_backend_address_pool" "az_lb_backend_pool" {
  count               = var.enable_load_balancer ? 1 : 0
  name                = lower("lbe-backend-pool-${var.resource_name_prefix[0]}")
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.az_public_sslb[count.index].id
}


resource "random_string" "cw_vol_rstring" {
    count = var.enable_cloud_watch ? length(var.vol_cloud_watch_def) * var.number_of_servers : 0
    length = var.rstring_length
    upper = var.rstring_upper
    lower = var.rstring_lower 
    number = var.rstring_number
    special = false

}

resource "random_string" "cw_sys_rstring" {
        count = var.enable_cloud_watch ? length(var.asg_cloud_watch_def) * var.number_of_servers : 0
        length = var.rstring_length
        upper = var.rstring_upper
        lower = var.rstring_lower
        number = var.rstring_number
        special = false

}

 resource "random_string" "elb_rstring" {
        count = var.type_elb == "classic" ? 1 : 0
        length = 16
        upper = true
        lower = false
        number = true
        special = false
}

resource "random_string" "asg_lstring" {
        count =  var.number_of_servers
        length = 8
        upper = true
        lower = false
        number = true
        special = false
}

resource "random_string" "asg_rstring" {
        count = var.number_of_servers
        length = 8
        upper = true
        lower = false
        number = true
        special = false
}

resource "random_string" "lb_rstring" {
        count = var.type_elb == "network" || var.type_elb == "application" ? local.no_of_lb :  0
        length = 8
        upper = true
        lower = false
        number = true
        special = false
}

resource "random_string" "tg_rstring" {
        count = var.type_elb == "network" || var.type_elb == "application" ? local.no_of_target_groups :  0
        length = 8
        upper = true
        lower = false
        number = true
        special = false
}

resource "random_string" "tg_lstring" {
        count = var.type_elb == "network" || var.type_elb == "application" ? local.no_of_target_groups :  0
        length = 8
        upper = true
        lower = false
        number = true
        special = false
}

 