output "subnets_id" {
  description = "Map of id values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "subnets_address_prefixes" {
  description = "Map of address_prefixes values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.address_prefixes if v.address_prefixes != null && length(v.address_prefixes) > 0 }
}
output "subnets_default_outbound_access_enabled" {
  description = "Map of default_outbound_access_enabled values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.default_outbound_access_enabled if v.default_outbound_access_enabled != null }
}
output "subnets_delegation" {
  description = "Map of delegation values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.delegation if v.delegation != null && length(v.delegation) > 0 }
}
output "subnets_ip_address_pool" {
  description = "Map of ip_address_pool values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.ip_address_pool if v.ip_address_pool != null && length(v.ip_address_pool) > 0 }
}
output "subnets_name" {
  description = "Map of name values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "subnets_private_endpoint_network_policies" {
  description = "Map of private_endpoint_network_policies values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.private_endpoint_network_policies if v.private_endpoint_network_policies != null && length(v.private_endpoint_network_policies) > 0 }
}
output "subnets_private_link_service_network_policies_enabled" {
  description = "Map of private_link_service_network_policies_enabled values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.private_link_service_network_policies_enabled if v.private_link_service_network_policies_enabled != null }
}
output "subnets_resource_group_name" {
  description = "Map of resource_group_name values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "subnets_service_endpoint_policy_ids" {
  description = "Map of service_endpoint_policy_ids values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.service_endpoint_policy_ids if v.service_endpoint_policy_ids != null && length(v.service_endpoint_policy_ids) > 0 }
}
output "subnets_service_endpoints" {
  description = "Map of service_endpoints values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.service_endpoints if v.service_endpoints != null && length(v.service_endpoints) > 0 }
}
output "subnets_sharing_scope" {
  description = "Map of sharing_scope values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.sharing_scope if v.sharing_scope != null && length(v.sharing_scope) > 0 }
}
output "subnets_virtual_network_name" {
  description = "Map of virtual_network_name values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.virtual_network_name if v.virtual_network_name != null && length(v.virtual_network_name) > 0 }
}

