locals {
  default_azure_configs = try(yamldecode(file("${path.root}/../environments/${var.environment}/default-env-config.yaml")), null)
  azure_compute         = try(yamldecode(file("${path.root}/../environments/${var.environment}/compute.yaml")), null)
  azure_network         = try(yamldecode(file("${path.root}/../environments/${var.environment}/networking.yaml")), null)
}
