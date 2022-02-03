provider "azurerm" {
  tenant_id                  = var.tenant_id
  subscription_id            = var.subscription_id
  client_id                  = var.sp_id
  client_secret              = var.sp_secret
  skip_provider_registration = true
  features {}
}
