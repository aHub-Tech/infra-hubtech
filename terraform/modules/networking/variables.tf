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
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}
