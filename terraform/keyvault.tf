# resource "azurerm_key_vault" "kv" {
#   name                        = format("%s-hubtech-vault", terraform.workspace)
#   resource_group_name         = azurerm_resource_group.rg.name
#   location                    = azurerm_resource_group.rg.location
#   enabled_for_disk_encryption = true
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false

#   sku_name = "standard"

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = "ccbc69b1-b131-4114-8485-374756246608"

#     key_permissions = [
#       "Get",
#       "Create",
#       "List"
#     ]

#     secret_permissions = [
#       "Get",
#       "Set",
#       "List"
#     ]

#     storage_permissions = [
#       "Get",
#       "Set",
#       "List"
#     ]
#   }
# }
