variable "az_region" {
	description="Required. Represent the Azure region. Default set to australiasoutheast"
	default="australiasoutheast"
}

variable "subscription_id" {
	description="Required. Represent the Subscription ID."
}
variable "client_id" {
	description="Required. Represent the Client ID."
}
variable "client_secret" {
	description="Required. Represent the Client Secret."
}
variable "tenant_id" {
	description="Required. Represent the Tenant ID."
}
variable "prefix" {
        type=string
        description="Prefix of Stack name"
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