data "aws_subnet_ids" "current" {

              vpc_id = var.vpc_id

}

 

data "null_data_source" "resource_name" {

              count = var.number_of_servers

              inputs = {

                             rname = lower(var.name_tag_format_type) == "name-az-index" ? format("%s%s-%d",var.resource_name_tag,substr(local.aws_azs[count.index%length(local.aws_azs)],length(local.aws_azs[count.index%length(local.aws_azs)])-1,1),floor(count.index/local.aws_az_count)):(lower(var.name_tag_format_type)=="name-index" ? format("%s-%d",var.resource_name_tag,count.index):(lower(var.name_tag_format_type)=="name-int" ? format("%s%04d",var.resource_name_tag,count.index+var.index_offset):var.resource_name_tag))

              }

}

 

data "null_data_source" "lb_type" {

              count = local.no_of_lb

              inputs = {

                             lbtype = count.index == 0 ? var.lb_type[0] : length(var.lb_type) > 1 ? var.lb_type[1] : var.lb_type[0]

              }

}

 

data "aws_subnet" "selected" {

              count = length(var.custom_subnet_id) > 0 ? length(var.custom_subnet_id) : "${length(data.aws_subnet_ids.current.ids)}"

              id = local.aws_subnet_ids[count.index]

#            filter {

#                           name = "subnet-id"

#                           values = length(var.custom_subnet_id) > 0 ? var.custom_subnet_id : ["*"]

#            }

}

 

data "aws_security_group" "default_sg" {

              count = var.default_sg ? length(var.default_security_group_name) : 0

              name = "${element(var.default_security_group_name,count.index)}"

}

data "aws_security_group" "default_elb_sg" {

        count = length(var.default_elb_security_group_name) > 0 ? length(var.default_elb_security_group_name) : 0

        name = "${element(var.default_elb_security_group_name,count.index)}"

}

data "template_file" "m_instance_user_data" {

              count = var.enable_user_data ? var.number_of_servers : 0

              template = "${file("${path.module}/${var.bootstrap_file}")}"

              vars = {

                             s3_bootscripts = var.s3_bootscript_bucket

                             DJOU = var.DJOU

                             environment = var.environment

                             aws_account_id = var.aws_account_id

                             ec2_hostname = lower(var.name_tag_format_type) == "name-az-index" ? format("%s%s-%d",var.resource_name_tag,local.aws_az_abbr[tolist(data.aws_subnet.selected.*.availability_zone)[count.index%length(data.aws_subnet.selected.*.id)]],floor(count.index/local.aws_az_count)):(lower(var.name_tag_format_type)=="name-index" ? format("%s-%d",var.resource_name_tag,count.index):(lower(var.name_tag_format_type)=="name-int" ? format("%s%04d",var.resource_name_tag,count.index+var.index_offset):var.resource_name_tag))

                             ec2_hostdomain = var.host_domain

                             dns_domain = var.dns_domain

                             StatelessStatefull = var.StatelessStatefull

                             alarms = var.enable_cloud_watch

                             aws_kms_key = var.ebs_kms_key_id

                             volume_size = length(join(",",data.template_file.vol_size.*.rendered)) == 0 ? 0 : join(",",data.template_file.vol_size.*.rendered)

                             volume_type = length(join(",",data.template_file.vol_type.*.rendered)) == 0 ? 0 : join(",",data.template_file.vol_type.*.rendered)

                             mount_point = length(join(",",data.template_file.mount_point.*.rendered)) == 0 ? "/dev/xvdb" : join(",",data.template_file.mount_point.*.rendered)

                             device_name = length(join(",",data.template_file.device_name.*.rendered)) == 0 ? "/opt/apps" : join(",",data.template_file.device_name.*.rendered)

                             remove_device_name = var.remove_device_name

                             splunk_role = var.splunk_role

              }

}

data "template_file" "vol_size" {

              count = var.enable_user_data ? "${length(var.ebs_volume_def)}" : 0

              template = "${lookup(var.ebs_volume_def[count.index],"size")}"

}

data "template_file" "vol_type" {

        count = var.enable_user_data ? "${length(var.ebs_volume_def)}" : 0

        template = "${lookup(var.ebs_volume_def[count.index],"type")}"

}

data "template_file" "mount_point" {

        count = var.enable_user_data ? "${length(var.ebs_volume_def)}" : 0

        template = "${lookup(var.ebs_volume_def[count.index],"mountpoint")}"

}

data "template_file" "device_name" {

        count = var.enable_user_data ? "${length(var.ebs_volume_def)}" : 0

        template = "${lookup(var.ebs_volume_def[count.index],"devicename")}"

}

data "aws_instance" "get_instance" {

#            count = var.refresh_data ? 1:0

              count = var.number_of_servers

              filter {

                             name = "tag:aws:autoscaling:groupName"

                             values = [ format("asg-%s-%s-%s",data.null_data_source.resource_name[count.index].outputs["rname"],"${random_string.asg_lstring[count.index].result}","${random_string.asg_rstring[count.index].result}")]

              }

 

              depends_on = [aws_autoscaling_group.tf_asg]

}