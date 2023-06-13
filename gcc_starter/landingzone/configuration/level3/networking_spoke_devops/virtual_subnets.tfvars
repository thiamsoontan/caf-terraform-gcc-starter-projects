
virtual_subnets = {

  # begin devops zone
  devops_runner_subnet = {
    name    = "runner-devops"
    cidr    = ["100.65.0.0/24"] 
    nsg_key = "runner_nsg"
    service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]    
    vnet = {
      id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-devops"
    }      
  } 
  # end devops zone
}
