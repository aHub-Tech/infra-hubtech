resource "azurerm_virtual_network" "netw" {
  name                = var.network.name
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
