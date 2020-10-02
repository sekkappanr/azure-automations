variable "internal_rules" {
    description = "Optional. Map of known security group rules (defined as 'rule_name' = ['description','from_port', 'to_port', 'protocol'])"
    type = map(list(any))
    default = {
        splunk-firewall = ["Splunk default port configuration",9998,9998,"tcp","splunk-firewall","",""]
        all-ssh = ["Default rule to open ssh port acces for all protocols",22,22,"tcp","all-ssh","",""]
        all-ports = ["Default rule to open ssh port acces for all protocols",-1,-1,"-1","all-portsl","",""]
        none = ["","","","","","","",""]
    }
}