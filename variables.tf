variable "subnets" {
  description = <<EOT
Map of subnets, attributes below
Required:
    - name
    - resource_group_name
    - virtual_network_name
Optional:
    - address_prefixes
    - default_outbound_access_enabled
    - private_endpoint_network_policies
    - private_link_service_network_policies_enabled
    - service_endpoint_policy_ids
    - service_endpoints
    - sharing_scope
    - delegation (block):
        - name (required)
        - service_delegation (required, block):
            - actions (optional)
            - name (required)
    - ip_address_pool (block):
        - id (required)
        - number_of_ip_addresses (required)
EOT

  type = map(object({
    name                                          = string
    resource_group_name                           = string
    virtual_network_name                          = string
    address_prefixes                              = optional(list(string))
    default_outbound_access_enabled               = optional(bool)
    private_endpoint_network_policies             = optional(string)
    private_link_service_network_policies_enabled = optional(bool)
    service_endpoint_policy_ids                   = optional(set(string))
    service_endpoints                             = optional(set(string))
    sharing_scope                                 = optional(string)
    delegation = optional(list(object({
      name = string
      service_delegation = object({
        actions = optional(set(string))
        name    = string
      })
    })))
    ip_address_pool = optional(object({
      id                     = string
      number_of_ip_addresses = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.subnets : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnets : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnets : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnets : (
        v.address_prefixes == null || (alltrue([for x in v.address_prefixes : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnets : (
        v.delegation == null || alltrue([for item in v.delegation : (item.service_delegation.actions == null || (alltrue([for x in item.service_delegation.actions : contains(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/publicIPAddresses/join/action", "Microsoft.Network/publicIPAddresses/read", "Microsoft.Network/virtualNetworks/read", "Microsoft.Network/virtualNetworks/subnets/action", "Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"], x)])))])
      )
    ])
    error_message = "must be one of: Microsoft.Network/networkinterfaces/*, Microsoft.Network/publicIPAddresses/join/action, Microsoft.Network/publicIPAddresses/read, Microsoft.Network/virtualNetworks/read, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action, Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
  }
  validation {
    condition = alltrue([
      for k, v in var.subnets : (
        v.ip_address_pool == null || (can(regex("^[1-9]\\d*$", v.ip_address_pool.number_of_ip_addresses)))
      )
    ])
    error_message = "`number_of_ip_addresses` must be a string that represents a positive number"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

