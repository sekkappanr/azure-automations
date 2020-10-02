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
variable "rg_tf_state" {
    type=string
	description="Required. The Resource group which maintains the terraform state file"
}
variable "storage_tf_state" {
    type=string
	description="Required. The Storage account which maintains the terraform state file"
}
variable "container_tf_state" {
    type=string
	description="Required. The Container which maintains the terraform state file"
}
variable "resource_name_prefix" {
	description="Optional.Represents the resoruce name prefix to be associated. Default SG"
	type=list(string)
	default="nsg"
}

variable "custom_irules" {
    description=""
    type=list(map(string))
    default=[]
}

variable "custom_irules_source" {
    description=""
    type=list(map(string))
    default=[]
}

variable "standard_tags" {
    description="Required.Represents a list of standard mapping of tags to assign to aws ec2 instance. Default set to null"
    type=map(string)
    default={}
}

variable "custom_tags" {
    description="Optional.Represents a list of custom mapping of tags to assign to aws ec2 instance"
    type=map(string)
    default={}
}

variable "security_group_name" {
    description="Required. Represents the security group name"
    type=string
}