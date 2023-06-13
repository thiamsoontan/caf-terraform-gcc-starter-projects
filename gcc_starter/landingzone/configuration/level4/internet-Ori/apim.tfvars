api_management = {
  integration_apim_re1 = {
    name                 = "web-re1"
    resource_group_key = "apim_rg_re1"
    publisher_name       = "My Company"
    publisher_email      = "company@terraform.io"
    sku_name             = "Premium_1" # "Developer_1" # 05 May 2023
    
    identity = {
      type = "UserAssigned"

      managed_identity_keys = ["apim_msi"] # local managed identities

      # # remote managed identities
      # remote = { # Use that block to reference a remote user MSI
      #   "shared_services" = {
      #     managed_identity_keys = [
      #       "apim_internet_msi"
      #     ]
      #   }
      # }
    
    }    
    virtual_network_type = "Internal"
    virtual_network_configuration = {
      subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-app-internet"
    }

    #TODO: add diagnostic_profiles
    # not working here
    #diagnostic_profiles = {
    #  operations = {
    #    definition_key   = "apim"
    #    destination_type = "log_analytics"
    #    destination_key  = "central_logs"
    #  }
    #}    

    tags = { 
      purpose = "internet apim" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "web"          
    }
  }
}
