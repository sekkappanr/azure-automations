resource "azurerm_network_security_group" "splunkcluster" {
  name                = "acceptanceTestSecurityGroup1"
  location            = "${azurerm_resource_group.satya.location}"
  resource_group_name = "${azurerm_resource_group.satya.name}"

  tags {
    environment = "janasena"
  }
}

resource "azurerm_network_security_rule" "example" {
  name                        = "test123"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example.name
}