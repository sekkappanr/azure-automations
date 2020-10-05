############### The below module config is defined to create VM related Network security groups. ####################
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

############### This Module is used to create VM Scale Set ########################

module "vm_scaleset_cluster" {
        source = "../../root/modules/vmset_lb/"
        resource_group_name=azurerm_resource_group.application_resource_group.name
        image_regex = "${var.image_regex}"
        enable_load_balancer=var.enable_load_balancer
        load_balancer_type = var.load_balancer_type   
        resource_name_tag = "${var.resource_name_tag}"
        resource_name_prefix = var.resource_name_prefix
        load_balancer_sku = var.load_balancer_sku
        create_individual_lb = var.create_individual_lb
    #    vmset_min_size = var.vmset_min_size
   #     vmset_max_size = var.vmset_max_size
        #vmset_desired_capacity = var.vmset_desired_capacity
       # admin_username = var.admin_username
      #  disable_password_authentication = false
       # default_security_group_name="${var.default_security_group_name}"

      #  securitygroup_id = length(var.custom_irules) > 0 ? module.ec2_sg.security_group_id[0] : null


     #   name_tag_format_type = var.name_tag_format_type
    #    s3_bootscript_bucket = var.s3_bootscript_bucket
   #     number_of_servers = var.number_of_servers
  #      server_type = "${var.server_type}"
 #       offering = var.offering

 
}

#resource "aws_route53_record" "elb_dns" {

#              count = var.enable_route53 ? 1 : 0

#              zone_id = data.aws_route53_zone.selected[0].zone_id

#              name = "${var.route53_elb_name}.${data.aws_route53_zone.selected[0].name}"

#              type = "CNAME"

#              ttl = "60"

#              records = var.type_elb == "network" || var.type_elb == "application" ? ["${module.asg_elb_cluster.aws_lb_dns}"]:["${data.aws_elb.name[0].dns_name}"]

#}

             