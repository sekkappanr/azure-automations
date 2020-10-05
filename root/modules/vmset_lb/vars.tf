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