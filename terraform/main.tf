module "context" {
  source      = "./modules/context"
  environment = terraform.workspace
}

resource "azurerm_resource_group" "rg" {
  count    = module.context.default_azure_configs != null ? 1 : 0
  name     = module.context.default_azure_configs.rg_name
  location = module.context.default_azure_configs.location
}

module "networking" {
  source   = "./modules/networking"
  for_each = try(module.context.azure_network.networks, {})

  location   = azurerm_resource_group.rg[0].location
  network    = merge({ name = each.key }, each.value)
  rg_name    = azurerm_resource_group.rg[0].name
  subnetwork = each.value.subnets
}

module "compute" {
  source = "./modules/compute/vm"

  location = azurerm_resource_group.rg[0].location
  rg_name  = azurerm_resource_group.rg[0].name
  inputs   = { for k, v in module.context.azure_compute.vms : k => merge(module.context.default_azure_configs.compute.vm, v) }
}
