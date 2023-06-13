keyvaults = {

  # # vm
  # example_vm_rg1 = {
  #   name               = "kvvmwin01"
  #   resource_group_key = "vm_windows_tooling_re1"
  #   sku_name           = "standard"
  #   soft_delete_enabled         = false    # set to true for production
  #   purge_protection_enabled    = false    # set to true for production    

  #   tags = { 
  #     purpose = "{{zone_code}} vm windows tooling server key vault" 
  #     project-code = "{{project_code}}" 
  #     env = "{{caf_environment}}" 
  #     zone = "{{zone_code}}"
  #     tier = "{{tier_code}}"          
  #   }    

  #   creation_policies = {
  #     logged_in_user = {
  #       secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
  #     }
  #   }
  # }

  # agw
  certificates = {
    name               = "certs"
    resource_group_key = "agw_rg_re1"
    sku_name           = "standard"
    soft_delete_enabled         = false    # set to true for production
    purge_protection_enabled    = false    # set to true for production    

    enabled_for_deployment = true

    creation_policies = {
      logged_in_user = {
        certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover"]
        secret_permissions      = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

    # 27 Sep 2022 - add in diagnostic_profiles and tags
    # diagnostic_profiles = {
    #   operations = {
    #     definition_key   = "keyvault"
    #     destination_type = "log_analytics" # or destination_type = "event_hub"
    #     destination_key  = "central_logs"          
    #   }
    # }

    tags = { 
      purpose = "<project_code> keyvaults" 
      project-code = "<project_code>" 
      env = "<env>" 
      zone = "<zone>"
      tier = "<tier>"        
    }  

  } 

  # apim
  apim_kv_re1 = {
    name               = "apim-certs"
    resource_group_key = "apim_rg_re1"
    sku_name           = "standard"

    enabled_for_deployment = true

    creation_policies = {
      logged_in_user = {
        certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover"]
        secret_permissions      = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

    tags = { 
      purpose = "internet apim kayvault" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "app"          
    }  

  }

  # container group - container instances
  secrets = {
    name               = "ci-secrets"
    resource_group_key = "container_groups_re1"
    sku_name           = "standard"

    enabled_for_deployment = true

    creation_policies = {
      logged_in_user = {
        certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover"]
        secret_permissions      = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
      nginx = {
        managed_identity_key = "nginx"
        secret_permissions   = ["Get"]
      }
    }
  }

}



keyvault_access_policies = { 
  apim_kv_re1 = { # << name of key vault
    apgw_keyvault_secrets = { # << keyvault key
      managed_identity_key    = "apim_msi"
      certificate_permissions = ["Get", "List"]
      secret_permissions      = ["Get", "List"]
    }
  }
}


api_management_certificate = {
  apimc1 = {
    name = "example-cert"
    api_management = {
      key = "integration_apim_re1"
    }
    resource_group = {
      key = "apim_rg_re1"
    }
    key_vault_secret = {
      certificate_key = "kv_cert_re1"
    }
    key_vault_identity_client = {
      key = "apim_msi"
    }
  }
}


# keyvaults = {
#   certificates = {
#     name               = "certs"
#     resource_group_key = "agw_rg_re1"
#     sku_name           = "standard"
#     soft_delete_enabled         = false    # set to true for production
#     purge_protection_enabled    = false    # set to true for production    

#     enabled_for_deployment = true

#     creation_policies = {
#       logged_in_user = {
#         certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover"]
#         secret_permissions      = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
#       }
#     }

#     # 27 Sep 2022 - add in diagnostic_profiles and tags
#     # diagnostic_profiles = {
#     #   operations = {
#     #     definition_key   = "keyvault"
#     #     destination_type = "log_analytics" # or destination_type = "event_hub"
#     #     destination_key  = "central_logs"          
#     #   }
#     # }

#     tags = { 
#       purpose = "<project_code> keyvaults" 
#       project-code = "<project_code>" 
#       env = "<env>" 
#       zone = "<zone>"
#       tier = "<tier>"        
#     }  

#   } 
# }

# keyvault_access_policies = {
#   certificates = {
#     apgw_keyvault_secrets = {
#       managed_identity_key    = "apgw_keyvault_secrets"
#       certificate_permissions = ["Get"]
#       secret_permissions      = ["Get"]
#     }
#   }
# }