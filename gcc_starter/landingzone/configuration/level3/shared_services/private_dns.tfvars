private_dns = {
  ops_dns_re1 = {

    ## To deploy this with updated ip addresses after ACR is created
    ## For more info https://github.com/aztfmod/terraform-azurerm-caf/blob/b478c43a592f21ae11041dfe03c208c468ccf2e4/modules/networking/private-dns/virtual_network_link.tf

    name               = "privatelink.azurecr.io" # must be this name 0 do not change
    resource_group_key = "ops_rg_re1"

    vnet_links = {
      app_ingress_vnet_link = {
        name               = "app-ingress-vnet"
        registration_enabled = true
        virtual_network_id = "/subscriptions/{your subscription id}/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-ingress"
      }      
      app_internet_vnet_link = {
        name               = "app-internet-vnet"
        registration_enabled = true
        virtual_network_id = "/subscriptions/{your subscription id}/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet"
      }  
      app_management_vnet_link = {
        name               = "app-management-vnet"
        registration_enabled = true
        virtual_network_id = "/subscriptions/{your subscription id}/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-management"
      }  
      app_devops_vnet_link = {
        name               = "app-devops-vnet"
        registration_enabled = true
        virtual_network_id = "/subscriptions/{your subscription id}/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-devops"
      }               
    }

    tags = { 
      purpose = "internet private dns" 
      project-code = "ignite" 
      env = "sandpit" 
      zone = "internet"        
    }      
    
  }
}
