resource_groups = {

  # acr_re1 = {
  #   name = "acr-re1"
  #   region = "region1"      
  #   tags = { 
  #     purpose = "internet acr resource group" 
  #     project-code = "cep" 
  #     env = "sandpit" 
  #     zone = "internet"
  #     tier = "web"          
  #   }    
  # }

  agw_rg_re1 = {
    name = "agw-re1"           
    region = "region1"    
    tags = { 
      purpose = "internet agw resource group" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "web"          
    }       
  }

  apim_rg_re1 = {
    name = "apim-rg-re1"           
    region = "region1"    
    tags = { 
      purpose = "internet apim resource group" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "app"          
    }  
  }  

  function_app_re1 = {
    name = "function-app-re1"
    region = "region1"      
    tags = { 
      purpose = "internet function app resource group" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "web"          
    }   
  }  

  container_groups_re1 = {
    name   = "container_groups_re1"
    region = "region1"
  } 

  cosmodb_re1 = {
    name = "cosmo-db-re1"
    region = "region1"      
    tags = { 
      purpose = "internet cosmodb resource group" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "db"          
    }   
  } 

  storage_accounts_re1 = {
    name = "storage-accounts-re1"
    region = "region1"      
    tags = { 
      purpose = "internet storage accounts resource group" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "app"          
    }   
  }   

  # aks_re1 = {
  #   name = "aks-re1" 
  #   region = "region1"      
  #   tags = { 
  #     purpose = "internet aks resource group" 
  #     project-code = "cep" 
  #     env = "sandpit" 
  #     zone = "internet"
  #     tier = "app"          
  #   } 
  # }
  # agw_re1 = {
  #   name = "agw-re1"
  #   region = "region1"      
  #   tags = { 
  #     purpose = "{{zone_code}} vm tooling server resource group" 
  #     project-code = "{{project_code}}" 
  #     env = "{{caf_environment}}" 
  #     zone = "{{zone_code}}"
  #     tier = "{{tier_code}}"          
  #   }    
  # }

  # apim_re1 = {
  #   name = "apim-re1"
  #   region = "region1"      
  #   tags = { 
  #     purpose = "{{zone_code}} vm tooling server resource group" 
  #     project-code = "{{project_code}}" 
  #     env = "{{caf_environment}}" 
  #     zone = "{{zone_code}}"
  #     tier = "{{tier_code}}"          
  #   }    
  # }  

  # container_instance_re1 = {
  #   name = "container-instance-re1"
  #   region = "region1"      
  #   tags = { 
  #     purpose = "{{zone_code}} vm tooling server resource group" 
  #     project-code = "{{project_code}}" 
  #     env = "{{caf_environment}}" 
  #     zone = "{{zone_code}}"
  #     tier = "{{tier_code}}"          
  #   }    
  # }    

}

