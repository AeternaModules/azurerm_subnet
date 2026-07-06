output "subnets" {
  description = "All subnet resources"
  value       = azurerm_subnet.subnets
}
output "subnets_address_prefixes" {
  description = "List of address_prefixes values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.address_prefixes]
}
output "subnets_default_outbound_access_enabled" {
  description = "List of default_outbound_access_enabled values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.default_outbound_access_enabled]
}
output "subnets_delegation" {
  description = "List of delegation values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.delegation]
}
output "subnets_ip_address_pool" {
  description = "List of ip_address_pool values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.ip_address_pool]
}
output "subnets_name" {
  description = "List of name values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.name]
}
output "subnets_private_endpoint_network_policies" {
  description = "List of private_endpoint_network_policies values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.private_endpoint_network_policies]
}
output "subnets_private_link_service_network_policies_enabled" {
  description = "List of private_link_service_network_policies_enabled values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.private_link_service_network_policies_enabled]
}
output "subnets_resource_group_name" {
  description = "List of resource_group_name values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.resource_group_name]
}
output "subnets_service_endpoint_policy_ids" {
  description = "List of service_endpoint_policy_ids values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.service_endpoint_policy_ids]
}
output "subnets_service_endpoints" {
  description = "List of service_endpoints values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.service_endpoints]
}
output "subnets_sharing_scope" {
  description = "List of sharing_scope values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.sharing_scope]
}
output "subnets_virtual_network_name" {
  description = "List of virtual_network_name values across all subnets"
  value       = [for k, v in azurerm_subnet.subnets : v.virtual_network_name]
}

