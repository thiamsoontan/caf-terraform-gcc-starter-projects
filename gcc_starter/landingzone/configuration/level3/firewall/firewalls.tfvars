azurerm_firewalls = {
  # ingress firewall
  fw_re1 = {
    name               = "ingress"
    resource_group_key = "networking_firewall_re1"
    # add the resource group name to resolve the issue of subnet rg different from firewall rg
    # TODO: subnet resource group name - input as variable for code generation
    # ** firewall MUST be in the same resource group as VNet and Subnet AzureFirewallSubnet
    # resource_group_name = "s01-rg-agency-vnets" # the resource group name of the subnet
    resource_group_name = "gcci-rg-agency-vnets" # the resource group name of the subnet    
    # subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/s01-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/s01-vnet-hub-ingress-re1/subnets/AzureFirewallSubnet"
    subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-ingress/subnets/AzureFirewallSubnet"
    sku_tier = "Premium"
    firewall_policy_key = "policy1"    
    public_ips = {
      ip_configuration = {
        name = "public-ip"
        public_ip_key = "firewall_re1"
        # subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/s01-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/s01-vnet-hub-ingress-re1/subnets/AzureFirewallSubnet"          
        subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-ingress/subnets/AzureFirewallSubnet"
      }
    }

    # management subnet is required for force tunneling
    #management_ip_configuration = {
    #  management_ip_configuration = {
    #    name = "management-ip"
    #    public_ip_key = "firewall_pip2_re1"
    #    subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/s01-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/s01-vnet-hub-ingress-re1/subnets/AzureFirewallManagementSubnet"          
    #  }
    #}    

    # azurerm_firewall_network_rule_collections = [
    #   "aks"
    # ]

    # azurerm_firewall_application_rule_collections = [
    #   "aks",
    #   "packages"
    # ]

    # azurerm_firewall_nat_rule_collections = [
    #   "aks"
    # ]    

    # 27 Sep 2022 - add diagnostic_profiles and tags
    tags = { 
      purpose = "ingress networking spoke resource group" # replace with purpose
      project-code = "cep" # replace with project code 
      env = "sandpit" # replace with project env
      zone = "cep" # replace with zone         
    } 

#    diagnostic_profiles = {
#      operations = {
#        definition_key   = "azurerm_firewall"
#        destination_type = "log_analytics"
#        destination_key  = "central_logs"
#        lz_key = "shared_services"     # is this required?    
#      }
#    }

  }

  # egress firewall
  fw2_re1 = {
    name               = "egress"
    resource_group_key = "networking_firewall_re1"
    # add the resource group name to resolve the issue of subnet rg different from firewall rg
    # TODO: subnet resource group name - input as variable for code generation
    # ** firewall MUST be in the same resource group as VNet and Subnet AzureFirewallSubnet
    # resource_group_name = "s01-rg-agency-vnets" # the resource group name of the subnet
    resource_group_name = "gcci-rg-agency-vnets" # the resource group name of the subnet    
    # subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/s01-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/s01-vnet-hub-ingress-re1/subnets/AzureFirewallSubnet"
    subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-egress/subnets/AzureFirewallSubnet"
    sku_tier = "Standard"
    firewall_policy_key = "policy2"    
    public_ips = {
      ip_configuration = {
        name = "public-ip"
        public_ip_key = "firewall2_re1"
        # subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/s01-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/s01-vnet-hub-ingress-re1/subnets/AzureFirewallSubnet"          
        subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-egress/subnets/AzureFirewallSubnet"
      }
    }

    # management subnet is required for force tunneling
    #management_ip_configuration = {
    #  management_ip_configuration = {
    #    name = "management-ip"
    #    public_ip_key = "firewall_pip2_re1"
    #    subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/s01-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/s01-vnet-hub-ingress-re1/subnets/AzureFirewallManagementSubnet"          
    #  }
    #}    

    # azurerm_firewall_network_rule_collections = [
    #   "aks"
    # ]

    # azurerm_firewall_application_rule_collections = [
    #   "aks",
    #   "packages"
    # ]

    # azurerm_firewall_nat_rule_collections = [
    #   "aks"
    # ]    

    # 27 Sep 2022 - add diagnostic_profiles and tags
    tags = { 
      purpose = "ingress networking spoke resource group" # replace with purpose
      project-code = "cep" # replace with project code 
      env = "sandpit" # replace with project env
      zone = "cep" # replace with zone         
    } 

#    diagnostic_profiles = {
#      operations = {
#        definition_key   = "azurerm_firewall"
#        destination_type = "log_analytics"
#        destination_key  = "central_logs"
#        lz_key = "shared_services"     # is this required?    
#      }
#    }

  }  

}



azurerm_firewall_policies = {
  # for ingress firewall
  policy1 = {
    name               = "firewall_policy"
    resource_group_key = "networking_firewall_re1"
    region             = "region1"
    sku                = "Premium"

    #   threat_intelligence_mode = "Alert"

    #   threat_intelligence_allowlist = {
    #     ip_addresses = []
    #     fqdns        = []
    #   }

    #   intrusion_detection = {
    #     mode                = "Alert"
    #     signature_overrides = {
    #       id    = ""
    #       state = ""
    #     }
    #     traffic_bypass      = {
    #       name                  = ""
    #       protocol              = ""
    #       description           = ""
    #       destination_addresses = ""
    #       destination_ip_groups = ""
    #       destination_ports     = ""
    #       source_addresses      = ""
    #       source_ip_groups      = ""
    #     }
  }

  # for egress firewall
  policy2 = {
    name               = "egress_firewall_policy"
    resource_group_key = "networking_firewall_re1"
    region             = "region1"
    sku                = "Standard"

    #   threat_intelligence_mode = "Alert"

    #   threat_intelligence_allowlist = {
    #     ip_addresses = []
    #     fqdns        = []
    #   }

    #   intrusion_detection = {
    #     mode                = "Alert"
    #     signature_overrides = {
    #       id    = ""
    #       state = ""
    #     }
    #     traffic_bypass      = {
    #       name                  = ""
    #       protocol              = ""
    #       description           = ""
    #       destination_addresses = ""
    #       destination_ip_groups = ""
    #       destination_ports     = ""
    #       source_addresses      = ""
    #       source_ip_groups      = ""
    #     }
  }  
}

azurerm_firewall_policy_rule_collection_groups = {
  group1 = {
    #firewall_policy_id = "Azure Resource ID"
    firewall_policy_key = "policy1"
    name                = "ingress-fwpolicy-rcg"
    priority            = 500

    # application_rule_collections = {
    #   rule1 = {
    #     name     = "app_rule_collection1"
    #     priority = 500
    #     action   = "Deny"
    #     rules = {
    #       rule1 = {
    #         name = "app_rule_collection1_rule1"
    #         protocols = {
    #           1 = {
    #             type = "Http"
    #             port = 80
    #           }
    #           2 = {
    #             type = "Https"
    #             port = 443
    #           }
    #         }
    #         source_addresses  = ["10.0.0.1"]
    #         destination_fqdns = ["*.microsoft.com"]
    #       }
    #     }
    #   }
    # }

    # network_rule_collections = {
    #   group1 = {
    #     name     = "network_rule_collection1"
    #     priority = 400
    #     action   = "Deny"
    #     rules = {
    #       rule1 = {
    #         name                  = "network_rule_collection1_rule1"
    #         protocols             = ["TCP", "UDP"]
    #         source_addresses      = ["10.0.0.1"]
    #         destination_addresses = ["192.168.1.1", "192.168.1.2"]
    #         destination_ports     = ["80", "1000-2000"]
    #       }
    #     }
    #   }
    # }

    nat_rule_collections = {
      group1 = {
        name     = "nat_rule_collection1"
        priority = 300
        action   = "Dnat"
        rules = {
          rule1 = {
            name             = "nat_rule_collection1_rule1"
            protocols        = ["TCP"]
            source_addresses = ["*"]
            # destination_address = "192.168.1.1"
            destination_address_public_ip_key = "firewall_re1"
            destination_ports                 = ["443"]
            translated_address                = "172.16.0.4" # TODO: Add private ip of app gw
            translated_port                   = "443"
          }
        }
      }
    }
  }

  group2 = {
    #firewall_policy_id = "Azure Resource ID"
    firewall_policy_key = "policy2"
    name                = "egress-fwpolicy-rcg"
    priority            = 500

    application_rule_collections = {
      rule1 = {
        name     = "app_rule_collection1"
        priority = 500
        action   = "Deny"
        rules = {
          rule1 = {
            name = "app_rule_collection1_rule1"
            protocols = {
              1 = {
                type = "Http"
                port = 80
              }
              2 = {
                type = "Https"
                port = 443
              }
            }
            source_addresses  = ["172.16.5.0/24"] # TODO: Change the source_address if required
            destination_fqdns = ["*.microsoft.com"] # TODO: Change the destination_fqdns if required
          }
        }
      }
    }

    # network_rule_collections = {
    #   group1 = {
    #     name     = "network_rule_collection1"
    #     priority = 400
    #     action   = "Deny"
    #     rules = {
    #       rule1 = {
    #         name                  = "network_rule_collection1_rule1"
    #         protocols             = ["TCP", "UDP"]
    #         source_addresses      = ["10.0.0.1"]
    #         destination_addresses = ["192.168.1.1", "192.168.1.2"]
    #         destination_ports     = ["80", "1000-2000"]
    #       }
    #     }
    #   }
    # }

    # nat_rule_collections = {
    #   group1 = {
    #     name     = "nat_rule_collection1"
    #     priority = 300
    #     action   = "Dnat"
    #     rules = {
    #       rule1 = {
    #         name             = "nat_rule_collection1_rule1"
    #         protocols        = ["TCP"]
    #         source_addresses = ["*"]
    #         # destination_address = "192.168.1.1"
    #         destination_address_public_ip_key = "firewall_re1"
    #         destination_ports                 = ["443"]
    #         translated_address                = "172.16.0.4" # TODO: Add private ip of app gw
    #         translated_port                   = "443"
    #       }
    #     }
    #   }
    # }
  }  

}
