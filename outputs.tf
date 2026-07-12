output "subnets_id" {
  description = "Map of id values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.id }
}
output "subnets_address_prefixes" {
  description = "Map of address_prefixes values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.address_prefixes }
}
output "subnets_default_outbound_access_enabled" {
  description = "Map of default_outbound_access_enabled values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.default_outbound_access_enabled }
}
output "subnets_delegation" {
  description = "Map of delegation values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.delegation }
}
output "subnets_ip_address_pool" {
  description = "Map of ip_address_pool values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.ip_address_pool }
}
output "subnets_name" {
  description = "Map of name values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.name }
}
output "subnets_private_endpoint_network_policies" {
  description = "Map of private_endpoint_network_policies values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.private_endpoint_network_policies }
}
output "subnets_private_link_service_network_policies_enabled" {
  description = "Map of private_link_service_network_policies_enabled values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.private_link_service_network_policies_enabled }
}
output "subnets_resource_group_name" {
  description = "Map of resource_group_name values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.resource_group_name }
}
output "subnets_service_endpoint_policy_ids" {
  description = "Map of service_endpoint_policy_ids values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.service_endpoint_policy_ids }
}
output "subnets_service_endpoints" {
  description = "Map of service_endpoints values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.service_endpoints }
}
output "subnets_sharing_scope" {
  description = "Map of sharing_scope values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.sharing_scope }
}
output "subnets_virtual_network_name" {
  description = "Map of virtual_network_name values across all subnets, keyed the same as var.subnets"
  value       = { for k, v in azurerm_subnet.subnets : k => v.virtual_network_name }
}

