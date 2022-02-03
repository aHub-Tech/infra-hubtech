data "azurerm_client_config" "current" {}
module "context" {
  source      = "./modules/context"
  environment = terraform.workspace
}

resource "azurerm_resource_group" "rg" {
  name     = module.context.default_azure_configs.rg_name
  location = module.context.default_azure_configs.location
}

module "ip" {
  source   = "./modules/ip"
  name     = "hub001-ip"
  rg_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

module "networking" {
  source   = "./modules/networking"
  for_each = try(module.context.azure_network.networks, {})

  location   = azurerm_resource_group.rg.location
  network    = merge({ name = each.key }, each.value)
  rg_name    = azurerm_resource_group.rg.name
  subnetwork = try(each.value.subnets, {})
  nsgs       = merge({ name = each.key }, module.context.azure_network.nsgs[each.key])
}

module "compute" {
  source = "./modules/compute/vm"

  location             = azurerm_resource_group.rg.location
  rg_name              = azurerm_resource_group.rg.name
  inputs               = { for k, v in module.context.azure_compute.vms : k => merge(module.context.default_azure_configs.compute.vm, v) }
  public_ip_address_id = "/subscriptions/0af73c23-b95f-446f-a172-802ead46da4a/resourceGroups/hub001_group/providers/Microsoft.Network/publicIPAddresses/hub001-ip"
}
