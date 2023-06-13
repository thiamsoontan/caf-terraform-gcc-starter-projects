# managed identity to attach to vm to download from the storage account
managed_identities = {
# # vm windows tooling server
#   user_mi = {
#     name               = "user_mi"
#     resource_group_key = "vm_windows_tooling_re1"
#   }

  # agw
  apgw_keyvault_secrets = {
    name               = "agw-secrets-msi"
    resource_group_key = "agw_rg_re1"

    tags = { 
      purpose = "internet agw managed identity" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "web"          
    }     
  }

  # apim
  apim_msi = {
    name               = "apim" 
    resource_group_key = "apim_rg_re1"
    tags = { 
      purpose = "internet apim managed identity" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "app"          
    }  
  }

  # container groups - container instances
  nginx = {
    name               = "nginx"
    resource_group_key = "container_groups_re1"
  }  

  # aks
  # aks_usermsi = {
  #   name               = "aks-usermsi" 
  #   resource_group_key = "aks_re1"

  #   tags = { 
  #     purpose = "internet aks managed identity" 
  #     project-code = "cep" 
  #     env = "sandpit" 
  #     zone = "internet"
  #     tier = "app"          
  #   }  
  # }  

}

