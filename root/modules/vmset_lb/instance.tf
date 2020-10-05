terraform {
    required_version = ">=0.12"
}

data "azurerm_image" "tfd_image" {
     name_regex = format("%s*",var.image_regex)
     resource_group_name=var.resource_group_name
}

#-----------------------------------
# Create the public IP for Azure Load Balancer
#-----------------------------------
resource "azurerm_public_ip" "az_public_ip" {
  count               = var.enable_load_balancer == true && var.load_balancer_type == "public" ? 1 : 0
  name                = lower("pbl-ip-vm-${var.resource_name_prefix[0]}-${var.az_region}-0${count.index + 1}")

  location            = var.az_region
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = format("vm_%s_pip0${count.index + 1}", lower(replace(var.resource_name_prefix[0], "/[[:^alnum:]]/", "")))

  #tags                = merge({ "ResourceName" = lower("pip-vm-${var.resource_name_prefix[0]}-${var.az_region}-0${count.index + 1}") }, var.tags, )

}

resource "azurerm_lb" "az_public_sslb" {
    count = var.enable_load_balancer == true && var.load_balancer_type == "public" ? 1 : 0
    name                = length(format("%s%s-%s",var.resource_name_prefix[3],var.resource_name_tag,random_string.lb_rstring[count.index].result)) > 32 ? substr(format("%s%s-%s",var.resource_name_prefix[3],var.resource_name_tag,random_string.lb_rstring[count.index].result),0,31) : format("%s%s-%s",var.resource_name_prefix[3],var.resource_name_tag,random_string.lb_rstring[count.index].result)
    location            = var.location
    resource_group_name = var.resource_group_name
    sku                 = var.load_balancer_sku
    tags                = merge({ "ResourceName" = var.load_balancer_type == "public" ? lower("lbext-${var.resource_name_tag}-${var.az_region}") : lower("lbint-${var.vmscaleset_name}-${var.az_region}") }, var.tags, )

    frontend_ip_configuration {
        name                          = var.load_balancer_type == "public" ? lower("lbext-frontend-${var.resource_name_prefix[0]}") : lower("lbint-frontend-${var.resource_name_prefix[0]}")

        public_ip_address_id          = var.enable_load_balancer == true && var.load_balancer_type == "public" ? azurerm_public_ip.az_public_ip[count.index].id : null

        private_ip_address_allocation = var.load_balancer_type == "private" ? var.private_ip_address_allocation : null
        private_ip_address            = var.load_balancer_type == "private" && var.private_ip_address_allocation == "Static" ? var.lb_private_ip_address : null

        #subnet_id                     = var.load_balancer_type == "private" ? data.azurerm_subnet.az_subnet.id : null
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



resource "random_string" "lb_rstring" {
        count = var.load_balancer_type == "private" || var.load_balancer_type == "public" ? local.no_of_lb :  0
        length = 8
        upper = true
        lower = false
        number = true
        special = false
}


 