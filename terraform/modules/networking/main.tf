resource "azurerm_virtual_network" "netw" {
  name                = format("%s_group-vnet", var.network.name)
  address_space       = var.network.address_space
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_subnet" "snet" {
  for_each             = var.subnetwork
  name                 = each.key
  resource_group_name  = azurerm_virtual_network.netw.resource_group_name
  virtual_network_name = azurerm_virtual_network.netw.name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  name                = format("%s-nsg", var.nsgs.name)
  location            = azurerm_virtual_network.netw.location
  resource_group_name = azurerm_virtual_network.netw.resource_group_name

  dynamic "security_rule" {
    for_each = var.nsgs.sgs

    content {
      name                       = security_rule.key
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      description                = ""
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
