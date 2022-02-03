resource "azurerm_public_ip" "ip" {
  name                = var.name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Dynamic"
}

output "id" {
  value = azurerm_public_ip.ip.id
}
