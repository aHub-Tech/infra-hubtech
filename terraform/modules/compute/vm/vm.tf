data "azurerm_subscription" "current" {}

resource "azurerm_network_interface" "iface" {
  for_each                      = var.inputs
  name                          = each.value.interface_name
  location                      = var.location
  resource_group_name           = var.rg_name
  enable_accelerated_networking = true

  ip_configuration {
    name                          = "ipconfig1"
    public_ip_address_id          = var.public_ip_address_id
    private_ip_address_allocation = "Dynamic"
    subnet_id = format(
      "%s/resourceGroups/%s/providers/Microsoft.Network/virtualNetworks/%s/subnets/%s",
      data.azurerm_subscription.current.id,
      var.rg_name,
      each.value.vnet_name,
      each.value.snet_name
    )
  }
}

resource "azurerm_virtual_machine" "main" {
  for_each              = var.inputs
  name                  = each.key
  location              = azurerm_network_interface.iface[each.key].location
  resource_group_name   = azurerm_network_interface.iface[each.key].resource_group_name
  network_interface_ids = [azurerm_network_interface.iface[each.key].id]
  vm_size               = each.value.size

  os_profile { # forces replacement
    admin_username = "hubuser"
    computer_name  = each.key
  }
  storage_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }

  storage_os_disk {
    name              = each.value.os_disk.name
    caching           = each.value.os_disk.caching
    create_option     = each.value.os_disk.create_option
    managed_disk_type = each.value.os_disk.managed_disk_type
    disk_size_gb      = each.value.os_disk.size_gb
  }

  os_profile_linux_config {
    disable_password_authentication = each.value.disable_pw_auth
  }

  lifecycle {
    ignore_changes = [
      boot_diagnostics,
    ]
  }
}
