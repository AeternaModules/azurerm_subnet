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
    default_outbound_access_enabled               = optional(bool)   # Default: true
    private_endpoint_network_policies             = optional(string) # Default: "Disabled"
    private_link_service_network_policies_enabled = optional(bool)   # Default: true
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
  # --- Unconfirmed validation candidates, derived from azurerm_subnet's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: address_prefixes[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: service_endpoint_policy_ids[*]
  #   source:    [from serviceendpointpolicies.ValidateServiceEndpointPolicyID] !ok
  # path: service_endpoint_policy_ids[*]
  #   source:    [from serviceendpointpolicies.ValidateServiceEndpointPolicyID] err != nil
  # path: sharing_scope
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delegation.service_delegation.name
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delegation.service_delegation.actions[*]
  #   condition: contains(["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/publicIPAddresses/join/action", "Microsoft.Network/publicIPAddresses/read", "Microsoft.Network/virtualNetworks/read", "Microsoft.Network/virtualNetworks/subnets/action", "Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"], value)
  #   message:   must be one of: Microsoft.Network/networkinterfaces/*, Microsoft.Network/publicIPAddresses/join/action, Microsoft.Network/publicIPAddresses/read, Microsoft.Network/virtualNetworks/read, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action, Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action
  # path: ip_address_pool.id
  #   source:    [from ipampools.ValidateIPamPoolID] !ok
  # path: ip_address_pool.id
  #   source:    [from ipampools.ValidateIPamPoolID] err != nil
  # path: ip_address_pool.number_of_ip_addresses
  #   condition: can(regex("^[1-9]\\d*$", value))
  #   message:   `number_of_ip_addresses` must be a string that represents a positive number
  # path: private_endpoint_network_policies
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

