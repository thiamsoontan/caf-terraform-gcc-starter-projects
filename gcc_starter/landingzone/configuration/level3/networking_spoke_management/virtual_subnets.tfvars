
virtual_subnets = {

  # begin management zone
  management_infra_subnet = {
    name    = "infra-management"
    cidr    = ["100.64.0.0/24"] 
    nsg_key = "jumpbox"
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]    
    vnet = {
      id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-management"
    }      
  } 

  management_security_subnet = {
    name    = "security-management"
    cidr    = ["100.64.1.0/24"] 
    nsg_key = "jumpbox"
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]    
    vnet = {
      id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-management"
    }      
  }  

  AzureBastionSubnet = {
    name    = "AzureBastionSubnet" # Must be called AzureBastionSubnet
    cidr    = ["100.64.2.0/24"] 
    nsg_key = "azure_bastion_nsg"
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]    
    vnet = {
      id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-management"

    }      
  }  
  # end management zone
}
