
virtual_subnets = {

  # begin ingress zone
  AzureFirewallSubnet = {
    name    = "AzureFirewallSubnet" # Must be called AzureFirewallSubnet
    cidr    = ["172.17.0.0/24"] 
    # nsg_key = "azure_fireall_ingress_nsg"
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]    
    vnet = {
      id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-ingress"

    }      
  }  
  # end ingress zone

  # begin egress zone
  AzureFirewallSubnet_egress = {
    name    = "AzureFirewallSubnet" # Must be called AzureFirewallSubnet
    cidr    = ["172.17.1.0/24"]  
    # nsg_key = "azure_fireall_ingress_nsg"
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]    
    vnet = {
      id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-egress"

    }      
  }  
  # end egress zone  
}
