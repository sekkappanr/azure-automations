variable "az_region" {
	description="Required. Represent the Azure region. Default set to australiasoutheast"
	default="australiasoutheast"
}

variable "image_regex" {
        description="Required. Represents the aws ami pattern search criteria for a given OS type"
        type=string
        default="azure"
}

variable "enable_load_balancer" {
        description="Optional. Represents if Load balance should be enabled. Default set to false"
        type=bool
        default=false
}

variable "load_balancer_type" {
        description="Required. Represents the azure load balance type"
        type=string
        default="private"
}

variable "load_balancer_sku" {
        description="Required. Represents the azure load balance SKU"
        type=string
        default="standard"
}

variable "resource_name_tag" {
        description="Required. Represents the custom tag name prefix for aws resources."
        type=string

}

variable "resource_name_prefix" {
        description="Optional.Represents the resoruce name prefix to be associated. Default SG"
        type=list(string)
        default=["asg-","lt-","tg-","elb-","alb-","nlb-"]
}


variable "resource_group_name" {
	description="Required. Represent the Resource Group Name "
    type=string
	default=""
}


variable "create_individual_lb" {
        description="Optional. Represents if individual load balancer for each server is required"
        type=bool
        default=false
}

variable "number_of_servers" {
        description="Required. Represents the number of servers that should be provisioned"
        type=number
        default=1
}

variable "private_ip_address_allocation" {
	description="Required. Represent the Resource Group Name "
    type=string
	default=""
}

variable "var.lb_private_ip_address" {
	description="Required. Represent the Resource Group Name "
    type=string
	default=""
}