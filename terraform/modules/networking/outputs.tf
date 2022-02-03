output "return" {
  value = merge(
    azurerm_virtual_network.netw,
    azurerm_subnet.snet
  )
}
