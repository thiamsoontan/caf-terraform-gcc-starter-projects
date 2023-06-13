# By default asp1 will inherit from the resource group location
app_service_plans = {
  asp1 = {
    resource_group_key  = "function_app_re1"
    name                = "asp-function-app"
    kind                = "Linux" # default is 'Windows', set to 'Linux'   OR kind = "FunctionApp"
    reserved            = true # 'reserved' has to be set to true when kind is set to 'Linux'
    sku = {
      tier = "Premium" # "Standard" # TODO: is this one OK?
      size = "S1"
    }
  }
}


function_apps = {
  # python - after created, update the Configuration > General settings > Python.version
  f1 = {
    name               = "private-python"
    resource_group_key = "function_app_re1"
    region             = "region1"

    app_service_plan_key = "asp1"
    storage_account_key  = "sa1"

    settings = {
      subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-app-function-apps-internet"
      enabled = true
      os_type = "linux"
      version = "~4"      
    }

# resource "azurerm_function_app" "functions" {
#   name                      = var.function_app_name
#   location                  = azurerm_resource_group.rg.location
#   resource_group_name       = azurerm_resource_group.rg.name
#   app_service_plan_id       = azurerm_app_service_plan.functions.id
#   storage_connection_string = azurerm_storage_account.functions.primary_connection_string
#   os_type                   = "linux"

#   version = "~3"

#   identity {
#     type = "SystemAssigned"
#   }

#   app_settings = {
#     https_only                     = true
#     FUNCTIONS_WORKER_RUNTIME       = "python"
#     FUNCTION_APP_EDIT_MODE         = "readonly"
#     APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.functions.instrumentation_key
#     storage_name                   = azurerm_storage_account.storage.name
#   }
# }

    # python
    app_settings = {
      https_only                = true
      FUNCTIONS_WORKER_RUNTIME  = "python"
      # FUNCTION_APP_EDIT_MODE    = "readonly"
      #APPINSIGHTS_INSTRUMENTATIONKEY = "azurerm_application_insights.functions.instrumentation_key"
      # storage_name                   = ""
    }

      # values in site_config
      # always_on                        = lookup(var.settings.site_config, "always_on", false)
      # app_scale_limit                  = lookup(var.settings.site_config, "app_scale_limit", null)
      # elastic_instance_minimum         = lookup(var.settings.site_config, "elastic_instance_minimum", null)
      # health_check_path                = lookup(var.settings.site_config, "health_check_path", null)
      # min_tls_version                  = lookup(var.settings.site_config, "min_tls_version", null)
      # pre_warmed_instance_count        = lookup(var.settings.site_config, "pre_warmed_instance_count", null)
      # runtime_scale_monitoring_enabled = lookup(var.settings.site_config, "runtime_scale_monitoring_enabled", null)
      # dotnet_framework_version         = lookup(var.settings.site_config, "dotnet_framework_version", null)
      # ftps_state                       = lookup(var.settings.site_config, "ftps_state", null)
      # http2_enabled                    = lookup(var.settings.site_config, "http2_enabled", null)
      # java_version                     = lookup(var.settings.site_config, "java_version", null)
      # linux_fx_version                 = lookup(var.settings.site_config, "linux_fx_version", null)
      # use_32_bit_worker_process        = lookup(var.settings.site_config, "use_32_bit_worker_process", null)
      # websockets_enabled               = lookup(var.settings.site_config, "websockets_enabled", null)
      # scm_type                         = lookup(var.settings.site_config, "scm_type", null)
      # scm_use_main_ip_restriction      = lookup(var.settings.site_config, "scm_use_main_ip_restriction", null)
      # vnet_route_all_enabled           = lookup(var.settings.site_config, "vnet_route_all_enabled", null)


    site_config = {
      always_on = true
      linux_fx_version = "Python|3.10"
      # application_stack = {
      #   python_version = "3.8"
      # }
    
    }



    identity = {
      type = "SystemAssigned"
    }

    tags = {
      application = "cep"
      env         = "sandpit"
    }
  }
  # nodejs - after created, update the Configuration > General settings > NodeJs.version
  f2 = {
    name               = "private-node"
    resource_group_key = "function_app_re1"
    region             = "region1"

    app_service_plan_key = "asp1"
    storage_account_key  = "fa_sa2"

    settings = {
      subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-app-function-apps-internet"
      enabled = true
      os_type = "linux"
      version = "~4"      
    }

    # node
    app_settings = {
      WEBSITE_RUN_FROM_PACKAGE = ""
      FUNCTIONS_WORKER_RUNTIME = "node"
      # APPINSIGHTS_INSTRUMENTATIONKEY = "azurerm_application_insights.application_insights.instrumentation_key"
    }

    site_config = {
      #java_version = "node|18"
      linux_fx_version          = " Node|18" # version: 18 LTS, 16 LTS or 14 LTS
      #node_version = "node|18"
      #functions_extension_version = "" 
      use_32_bit_worker_process = false
    }

    tags = {
      application = "cep"
      env         = "sandpit"
    }
  }

}
  # functions_extension_version = "~$(try(each.value.functions_extension_version, null))" # default to 4
  # virtual_network_subnet_id = try(each.value.virtual_network_subnet_id, null)

# linux_function_apps = {
#   # python - after created, update the Configuration > General settings > Python.version
#   linux_f1 = {
#     name               = "python-linux"
#     resource_group_key = "function_app_re1"
#     region             = "region1"

#     app_service_plan_key = "asp1"
#     storage_account_key  = "fa_sa3"

#   #functions_extension_version = "4" # default to 4
#   #virtual_network_subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-app-function-apps-internet"

#     settings = {
#       subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-app-function-apps-internet"
#       enabled = true
#       os_type = "linux"
#       version = "~4"      
#     }

#     # python
#     app_settings = {
#       https_only                = true
#       FUNCTIONS_WORKER_RUNTIME  = "python"
#     }


#     site_config = {
#       always_on = true
#       linux_fx_version = "Python|3.10"
#       application_stack = {
#         python_version = "3.10"
#       }
    
#     }



#     identity = {
#       type = "SystemAssigned"
#     }

#     tags = {
#       application = "cep"
#       env         = "sandpit"
#     }
#   }

  

# }
