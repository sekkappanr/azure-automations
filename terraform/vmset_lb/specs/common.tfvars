################ Terraform Common Config #################

az_region="Australia Southeast"
subscription_id="38f5f4d2-491a-4444-a70a-4e6dd8460ab1"
client_id ="7253038e-6604-4f6e-958e-f42c18372c4b"
client_secret="Tob4G_hNO59P9l~Hpw_G0R~9hgyxL_a4UC"
tenant_id="c12b80cd-6b61-4169-a57c-903b082296a8"
prefix ="sampletest"
image_regex="ami-nvi-aiops-splunkami_v1.0"
enable_load_balancer=true
load_balancer_type="private"
load_balancer_sku="Standard"
vmset_desired_capacity = 1
vmset_min_size = 1
vmset_max_size = 1
admin_username = "testing"
disable_password_authentication = true
s3_bootscript_bucket = "splunk-build-infra-config"

ami_owner="546363320159"

ebs_kms_key_id="arn:aws:kms:us-east-1:546363320159:key/94352859-1f4e-4b95-9729-700782d0cb0c"

ebs_volume_def=[{size:"50",type:"gp2",devicename:"/dev/xvdd",mountpoint:"/opt/splunk",encrypted:true}]

aws_account_id="546363320159"

provision_role="arn:aws:iam::546363320159:role/role-ec2-terraform-splunk-cluster"

server_type=["t2.medium","t2.large","t2.xlarge","t2.2xlarge","m4.2xlarge","m4.4xlarge","m5.4xlarge","c4.8xlarge","c5.9xlarge"]

################# Instance config #####################

ec2_instance_profile = "role-ec2-terraform-splunk-cluster"

root_device_name="/dev/sda1" # xvda for amzn, sda1 for centos/rhel

root_volume_size=100

dns_domain="nvinp-splunkcluster.mywizard-aiops.local"

host_domain="nvinp-splunkcluster.mywizard-aiops.local"

ec2_key_name="splunk-cluster-poc"

default_security_group_name=["secgrp-nviprvnp-platformgeneric","secgrp-nviprvnp-appgeneric","secgrp-splunk-cluster-common-ec2-JKJO028ULPO5"]

#default_security_group_name=["secgrp-nviprvnp-platformgeneric","secgrp-nviprvnp-appgeneric"]

default_sg=true

bootstrap_file="mywizardaiops_bootstrap"

enable_user_data=true

custom_subnet_id=["subnet-0c7c4e5afa3e81f56","subnet-02533a1f7b75fa870"]

custom_tags={TechnicalSerivce:"loganalysis",

        ClusterId:"SplunkClusterMVP",

        CustomTagA:"myWizard_AiOps_MAD",

        CustomerEnterpriseID:"srinivasa.kuruganti",

        Environment:"dev",

              created_by:"srinivasa.kuruganti",

        Initiative:"myWizard_AiOps",

        OS:"Centos",

        PlatformType:"dedicated",

        Role:"Splunk",

        clientName:"MAD",

        notes:"Splunk cluster MVP validation Only",

        splunk_version:"8.0.5",

              WBSEcode:"AVXY8003",

              launch_source:"SplunkCluster_Terraform",

              dlm_backup:true,

              Project:"MAD",

              Scheduler:"NA",

              ServiceEndDate:"30/10/2020"

}

############### Notifications configuration ################

enable_cloud_watch=false

enable_notifications=false

sns_topic_arn="arn:aws:sns:us-east-1:546363320159:AccentureOxygenNotification"

############### ASG/Loadbalancer common configuration ##############

default_elb_security_group_name=["secgrp-nvipubnp-elbweb","secgrp-nviprvnp-platformgeneric"]

public_dns_domain="mywizard-aiops.com"

asg_suspended_processes=["AlarmNotification","HealthCheck","Launch","ReplaceUnhealthy","Terminate"]

asg_desired_capacity = 1

asg_min_size = 1

asg_max_size = 1

custom_elb_tags={

        TechnicalService = "loganalysis"

}

asg_tags=[

        {

                key = "TechnicalService"

                value = "loganalysis"

                propagate_at_launch = true

        }]

############# ELB Common Configuration ####################

elb_internal=false

elb_subnet_list=["subnet-048fdd29dd1a9059f","subnet-0f1357f10649dfb67"]

elb_cookie=true

type_elb="application"

lb_type=["application"]

############# Network Settings #################

vpc_id="vpc-0f4499e6b480171de"

remove_device_name="/dev/sdb,/dev/sdc"