variable "inputs" {
  type = map(object({
    disable_pw_auth  = bool
    size             = string
    snet_name        = string
    vnet_name        = string
    interface_name   = string
    boot_diagnostics = bool
    os_disk = object({
      caching           = string
      create_option     = string
      managed_disk_type = string
      name              = string
      size_gb           = number
    })
    storage_image_reference = object({
      offer     = string
      publisher = string
      sku       = string
      version   = string
    })
  }))
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "public_ip_address_id" {
  type = string
}
