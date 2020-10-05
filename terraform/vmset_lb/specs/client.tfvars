resource_name_tag="test-env"

single_az=true

name_tag_format_type="standard"

number_of_servers=1

offering=1



security_group_name="plg-idx-master"

############### Load balancer configuration ################

elb_listeners = [

        { instance_port:"8000", instance_protocol:"HTTPS", lb_port:"443", lb_protocol:"HTTPS", ssl_certificate_id:"arn:aws:acm:us-east-1:546363320159:certificate/28206298-2b34-4831-9da4-db699f486575", ssl_policy:"ELBSecurityPolicy-TLS-1-2-Ext-2018-06" },]

lb_target_groups = [

                {instance_port:"8000", instance_protocol:"HTTPS",protocol:"HTTPS",healthy_threshold:2,unhealthy_threshold:2,port:"traffic-port",interval:30,path:"/en-US/account/login?",timeout:5,stickiness={type:"lb_cookie",enabled:true,duration:86400}},]

elb_health_checks = {

        target: "TCP:8000" ## set this parameter in case of classic load balancer

        interval: 30

        healthy_threshold: 2

        unhealthy_threshold: 2

        timeout: 5

        path: "/en-US/account/login?"

        protocol: "HTTPS"

        port: "traffic-port"

        }

route53_elb_name="splunk-plg-idx-master"

public_dns_domain="mywizard-aiops.com"

enable_route53=false

elb_cookie=true

splunk_role="master/nvinp-splunkcluster.mywizard-aiops.local/a,b"

lb_type=["application","application"]