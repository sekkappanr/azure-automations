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

variable "create_sg" {
  description="Optional. Represents if individual Network Security Group for each server is required"
  type=bool
  default=false
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

variable "rstring_length" {
    description="Optional. Represents the length of the random string to be generated. Default set to 12"
    type=number
    default=12
}

variable "rstring_upper" {
    description="Optional. Represents if the random string should contain upper characters. Default set to true"
    type=bool
    default=true

}

variable "rstring_lower" {
    description="Optional. Represents if the random string should contain lower characters. Default set to false"
    type=bool
    default=false
}

variable "rstring_number" {
    description="Optional. Represents if the random string should contain any numbers. Default set to true"
    type=bool
    default=true
}

 

 

 

 

 

 

 

 

 