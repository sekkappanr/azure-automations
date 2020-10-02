az_region="Australia Southeast"
subscription_id="38f5f4d2-491a-4444-a70a-4e6dd8460ab1"
client_id ="7253038e-6604-4f6e-958e-f42c18372c4b"
client_secret="Tob4G_hNO59P9l~Hpw_G0R~9hgyxL_a4UC"
tenant_id="c12b80cd-6b61-4169-a57c-903b082296a8"
prefix ="sampletest"

rg_tf_state ="terraform-state"
storage_tf_state ="managetfstatefile"
container_tf_state ="terraformstate"

custom_irules = [
        { from_port = "9887", to_port="9887", protocol="tcp", self_sg=true, name = "pfwd" , direction="Inbound"},
        { from_port = "9998]", to_port="9998", protocol="tcp",self_sg=true, name = "pfwds" , direction="Inbound"},
        { from_port = "8088", to_port="8088", protocol="tcp",self_sg=true, name = "pspl" , direction="Inbound"},
        { from_port = "8089", to_port="8089", protocol="tcp",cidr_block="", name = "pmgmt" , direction="Inbound"},
        { from_port = "8000", to_port="8000", protocol="tcp",self_sg=true, name = "pweb" , direction="Inbound"},
        { from_port = "8189", to_port="8189", protocol="tcp",self_sg=true, name = "prep" , direction="Inbound"},
        { from_port = "8191", to_port="8191", protocol="tcp",self_sg=true, name = "pqwe" , direction="Inbound"},
        { from_port = "9997", to_port="9997", protocol="tcp",cidr_block="", name = "ofwd2" , direction="Outbound"},
        { from_port = "8089", to_port="8089", protocol="tcp",self_sg=true, name = "ofwd" , direction="Outbound"},
]

custom_irules_source = [

]

security_group_name="cluster-common"