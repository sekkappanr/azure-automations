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

variable "number_of_servers" {

              description="Required. Represents the number of servers that should be provisioned"

              type=number

              default=1

}

variable "index_offset" {

              description="Optional. Represents the index offset for format type name-int. Default set to 0"

              type=number

              default=0

}

variable "server_type" {

              description="Required. Represents the type of server to be provisioned. Default set to t3.micro"

              type=list(string)

              default=["t3.micro"]

}

variable "offering" {

              description="Required. Represents the type of server to be provisioned. Default set to t3.micro"

              type=number

              default=0

}

variable "vpc_id" {

              description="Required. Represents the aws VPC Id"

              type=string

}

variable "instance_device_name" {

              description="Required. Represents the default instance root device mapping name."

              type=string

              default="/dev/xvdh"

}

variable "provision_role" {

              description="Required. Represents the aws IAM role for provisioning aws resources by Terraform. No default set "

              type=string

}

variable "bootstrap_file" {

              description="Optional. Represents the name of the user data file. This user data file contains the commands to be executed as part of ec2 instantiation"

              type=string

              default="standard_common"

}

variable "ami_owner" {

              description="Required. Represents the ami owner. Default set to amazon"

              type=string

              default="amazon"

}

variable "ebs_kms_key_id" {

              description="Required. Represents the kms key id used to encryp the EBS volume"

              type=string

}





variable "ec2_instance_profile" {

              description="Required. Represents the aws IAM role name to be attached with the ec2 instance.Default set to SplunkProvisioningRole"

              type=string

              default="arn:aws:iam::396500255757:role/SplunkProvisioningRole"

}

variable "ec2_key_name" {

              description="Required. Represents the aws ssh key-pari name to be attached with the ec2 instance"

              type=string

              default="splunk-key"

}

variable "elb_cookie" {

              description="Optional. Represents if elb cookie should be enabled. Default set to false"

              type=bool

              default=false

}

variable "enable_notifications" {

              description="Optional. Represents if aws asg notification should be enabled. Default set to false"

              type=bool

              default=false

}

variable "enable_cloud_watch" {

              description="Optional. Represents if aws cloudwatch alarm notifications should be enabled. Default set to false"

              type=bool

              default=true

}

variable "enable_user_data" {

              description="Optional. Represents if the any startup initilization scripts should be executed at time of ec2 instance launch. Default set to false"

              type=bool

              default=false

}

variable "ebs_volume_def" {

              description="Optional. Represents custom EBS volume details to enable attaching ebs volumes to be associated with ec2 instance"

              type=list(map(any))

              default=[]

}

variable "custom_tags" {

              description="Optional.Represents a list of custom mapping of tags to assign to aws ec2 instance"

              type=map(string)

              default={}

}

variable "custom_ebs_tags" {

              description="Optional.Represents a list of custom mapping of tags to assign to ebs volumes"

              type=map(string)

              default={}

}

variable "custom_elb_tags" {

              description="Optional. Represents a list of custom mapping of tags to assign to elb"

              type=map(string)

              default={}

}

variable "StatelessStatefull" {

              description="Optional. Represents the ec2 EBS volume state to determin if the EBS is a new mount or Existing.Default to 1"

              type=number

              default=1

}

variable "standard_tags" {

              description="Required.Represents a list of standard mapping of tags to assign to aws ec2 instance. Default set to null"

              type=map(string)

              default={}

}

variable "asg_custom_tags" {

              description="Required.Represents a list of standard mapping of tags to assign to aws asg resource. Default set to null"

              type=list(map(any))

              default=[]

}

variable "asg_tags" {

              description="Optional. Represents a list of standard mapping of tags to assign with asg resource. Default set to null"

              type=list(map(any))

              default=[]

}

variable "s3_bootscript_bucket" {

              description="Optional. Represents the S3 bucket where the default bootscripts are stored. Default value set to splunk-espcloud-bootscripts"

              type=string

              default="splunk-espcloud-bootscripts"

}

variable "host_domain" {

              description="Optional. Represents the domain under which the ec2 host DNS entry should be regirstered. Default value set to accentureoxygen.com"

              type=string

              default="splunk.accentureoxygen.com"

}

variable "dns_domain" {

              description="Optional. Represents the aws route53 zone domain under which the ec2 host should be registered. Default value set to accentureoxygen.com"

              type=string

              default="accentureoxygen.com"

}

variable "public_dns_domain" {

        description="Optional. Represents the aws route53 zone domain under which the ec2 host should be registered. Default value set to accentureoxygen.com"

        type=string

        default="accentureoxygen.com"

}

variable "ebs_block_rules" {

              description="Optional. Represents the ebs block device names for each availability zone. Default set to none"

              type=map(list(any))

              default={}

}

variable "asg_desired_capacity" {

              description="Required. Represents the autoscaling group desired capacity."

              type=number

}

variable "asg_max_size" {

              description="Required. Represents the autoscaling group max capacity."

              type=number

}

variable "asg_min_size" {

              description="Required. Represents the autoscaling group minimum capacity."

              type=number

}

 

variable "name_tag_format_type" {

              description="Optional. Represents the function to determine the resource naming convention. Default set to null"

              type=string

              default=null

}

variable "sns_topic_arn" {

              description="Required. Represents the SNS topic ARN to which the cloud watch alarm notifications are to be sent."

              type=string

              default=null

}

variable "default_sg" {

              description="Required. Represents if a default security group naeeds to be attached with every ec2 instance. By default the flag is turrned o"

              type=bool

              default=true

}

variable "default_security_group_name" {

              description="Required. Represents the default security group name to be attached with ec2 instance"

              type=list(string)

              default=[]

}

variable "default_elb_security_group_name" {

        description="Required. Represents the default security group name to be attached with ec2 instance"

        type=list(string)

        default=[]

}

variable "single_az" {

              description="Required. Represents if the autoscaling group should be assigned to single AZ or multi AZ. Default is set to false"

              type=bool

              default=false

}

variable "aws_account_id" {

              description="Required. Represents the cloudwatch aws account id"

              type=string

}

variable "custom_subnet_id" {

        description="Optional. Represents a list of subnet ids to which the server deployment is required."

        type=list

        default=[]

}

variable "asg_suspended_processes" {

              description="Optional. Represents the auto scaling group suspend policy. Default set to null"

              type=list

              default=[]

}

variable "asg_termination_policies" {

              description="Optional. Represents the auto scaling group termination policy. Default set to null"

              type=list

              default=[]

}

variable "type_elb" {

              description="Optional.Represents the type of aws load balancer resource to be provisioned. Default set to classic"

              type=string

              default="classic"

}

variable "environment" {

              description="Optional. Represents the window sytem registration key to be created for windows instance"

              type=string

              default="test"

}

variable "DJOU" {

              description="Optional. Represents the Windows system registration key to be created for windows instance"

              type=string

              default="TEST"

}

variable "root_device_name" {

              description="Required. Represents the root device name to be associated with specific instance."

              type=string

}

variable "root_volume_size" {

              description="Optional. Represents the root volume size to be provisioned in GB. Default to 20G"

              type=number

              default=20

}

variable "elb_listeners" {

        description="Optional. Represents the ELB listener configuration. Default set to null list"

        type=list(any)

        default=[]

}

variable "elb_listeners_rules" {

        description="Optional. Represents the ELB listener configuration. Default set to null list"

        type=list(any)

        default=[]

}

variable "lb_target_groups" {

        description="Optional. Represents the Target Group configuration. Default set to null list"

        type=any

        default=[]

}

variable "elb_health_checks" {

        description="Optional. Represents the elb healthcheck condition block. Default set to null map"

        type=map(string)

        default={}

}

variable "vol_cloud_watch_def" {

              description=""

              type=list(map(string))

              default = [

                             {

                                           "description"="- volume /opt/apps utilization is above 90% for 5 minutes"

                                           "metricname" = "DiskSpaceUtilization"

                                           "comparison_operator" = "GreaterThanThreshold"

                                           "eval_periods" = "5"

                                           "threshold" = "90"

                                           "period" = "60"

                                           "namespace" = "System/Linux"

                                           "statistic" = "Average"

                                           "filesytem" = "/dev/xvdb1"

                                           "mountpoint" = "/opt/apps"

                                           "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkMediumTopic"

                             },

                {

                        "description"="- volume /opt/apps utilization is above 80% for 5 minutes"

                        "metricname" = "DiskSpaceUtilization"

                        "comparison_operator" = "GreaterThanThreshold"

                        "eval_periods" = "5"

                        "threshold" = "80"

                        "period" = "60"

                        "namespace" = "System/Linux"

                        "statistic" = "Average"

                        "filesytem" = "/dev/xvdb1"

                        "mountpoint" = "/opt/apps"

                        "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkLowTopic"

                },

                {

                        "description"="- volume / utilization is above 90% for 5 minutes"

                        "metricname" = "DiskSpaceUtilization"

                        "comparison_operator" = "GreaterThanThreshold"

                        "eval_periods" = "5"

                        "threshold" = "90"

                        "period" = "60"

                        "namespace" = "System/Linux"

                        "statistic" = "Average"

                        "filesytem" = "/dev/xvdb1"

                        "mountpoint" = "/opt/apps"

                        "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkMediumTopic"

                },

                {

                        "description"="- volume / utilization is above 80% for 5 minutes"

                        "metricname" = "DiskSpaceUtilization"

                        "comparison_operator" = "GreaterThanThreshold"

                        "eval_periods" = "5"

                        "threshold" = "80"

                        "period" = "60"

                        "namespace" = "System/Linux"

                        "statistic" = "Average"

                        "filesytem" = "/dev/xvdb1"

                        "mountpoint" = "/opt/apps"

                        "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkMediumTopic"

                },

              ]

}

 

variable "elb_cloud_watch_def" {

              description=""

              type = list(map(string))

              default = [

                {

                        "description"="- ELB HealthCheck failed"

                        "metricname" = "UnHealthyHostCount"

                        "comparison_operator" = "GreaterThanOrEqualToThreshold"

                        "eval_periods" = "3"

                        "threshold" = "1"

                        "period" = "60"

                        "namespace" = "AWS/ELB"

                        "statistic" = "Maximum"

                        "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkMediumTopic"

                },

              ]

}

                                          

variable "asg_cloud_watch_def" {

              description=""

              type = list(map(string))

              default = [

                {

                        "description"="- EC2 status check failed"

                        "metricname" = "StatusCheckFailed"

                        "comparison_operator" = "GreaterThanOrEqualToThreshold"

                        "eval_periods" = "3"

                        "threshold" = "1"

                        "period" = "60"

                        "namespace" = "AWS/EC2"

                        "statistic" = "Average"

                        "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkMediumTopic"

                },

                {

                        "description"=": CPU above 80% for 10 minutes"

                        "metricname" = "CPUUtilization"

                        "comparison_operator" = "GreaterThanThreshold"

                       "eval_periods" = "10"

                        "threshold" = "80"

                        "period" = "60"

                        "namespace" = "AWS/EC2"

                        "statistic" = "Average"

                        "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkMediumTopic"

                },

                {

                        "description"=": CPU above 90% for 10 minutes"

                        "metricname" = "CPUUtilization"

                        "comparison_operator" = "GreaterThanThreshold"

                        "eval_periods" = "10"

                        "threshold" = "90"

                        "period" = "60"

                        "namespace" = "AWS/EC2"

                        "statistic" = "Average"

                        "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkMediumTopic"

                },

                {

                        "description"=": Memory above 80% for 10 minutes"

                        "metricname" = "MemoryUtilization"

                        "comparison_operator" = "GreaterThanThreshold"

                        "eval_periods" = "10"

                        "threshold" = "80"

                        "period" = "60"

                        "namespace" = "AWS/EC2"

                        "statistic" = "Average"

                        "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkMediumTopic"

                },

                {

                        "description"=": Memory above 90% for 10 minutes"

                        "metricname" = "MemoryUtilization"

                        "comparison_operator" = "GreaterThanThreshold"

                        "eval_periods" = "10"

                        "threshold" = "90"

                        "period" = "60"

                        "namespace" = "AWS/EC2"

                        "statistic" = "Average"

                        "alarmactions" = "arn:aws:sns:ap-southeast-2:111111111:NotifySplunkMediumTopic"

                },

 

              ]

}

variable "enable_route53" {

              description="Optional. Represents if route53 should be enabled. Default set to false"

              type=bool

              default=false

}

variable "resource_name_prefix" {

              description="Optional.Represents the resoruce name prefix to be associated. Default SG"

              type=list(string)

              default=["asg-","lt-","tg-","elb-","alb-","nlb-"]

}

variable "route53_elb_name" {

              description="Optional. Represents the route53 elb name to be configured."

              type=string

              default=""

}

variable "refresh_data" {

              description="Optional. Represents if data refresh is required. Default set to false"

              type=bool

              default=false

}

variable "private_zone" {

        description="Optional. Represents if the route53 hosted zone for elb dns registration is public or private By default the flag is turrned off"

        type=bool

        default=false

}

variable "elb_subnet_list" {

  description="Optional. Represents the application load balancer subnets. Default set to ec2 subnet id"

  type=list

  default=[]

}

variable "elb_internal" {

  description="Optional. Represents if the application load balancer is for internal or internet facing. Default is set to internet facing"

  type=bool

  default=false

}

variable "create_individual_alb" {

  description="Optional. Represents if individual load balancer for each server is required"

  type=bool

  default=false

}

variable "lb_type" {

  description="Optional. Represents the application load balancer types to be created. Default set to null"

  type=list

  default=[]

}

variable "remove_device_name" {

              description="Optional. Represent the pre configured mounts to be removed. Default null"

              type=string

              default=null

}

variable "splunk_role" {

              description="Optional. Represents the splunk role related to a server. Default null"

              type=string

              default=null

}