variable "network" {
  type = object({
    name          = string
    address_space = list(string)
  })
}

variable "subnetwork" {
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {}
}

variable "nsgs" {
  type = object({
    name = string
    sgs = map(object({
      priority               = number
      direction              = string
      access                 = string
      protocol               = string
      destination_port_range = number
    }))
  })
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}
