# TODO: add private endpoint or vnet injection

# This configuration demonstrates multiple implementations
# 1- OS Windows and Linux
# 2- instantiate container based on for_each, count or both
#

container_groups = {
  nginx = {
    name               = "nginx"
    region             = "region1"
    resource_group_key = "container_groups_re1"
    ip_address_type    = "Private" # "Public"
    os_type            = "Linux"
    restart_policy     = "Never" // Possible values are 'Always'(default) 'Never' 'OnFailure'
    #subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-app-internet"
    subnet_ids = ["/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-it-internet"]

    # You can also deploy the name container multiple times based on the count number
    containers = {

      # postfix = {
      #   name   = "postfix-smtp-relay"
      #   image  = "boky/postfix"
      #   cpu    = "0.5"
      #   memory = "0.3"

      #   ports = {
      #     80 = {
      #       port     = 80
      #       protocol = "TCP"
      #     }
      #     587 = {
      #       port     = 597
      #       protocol = "TCP"
      #     }            
      #     22 = {
      #       port     = 22
      #       protocol = "TCP"
      #     }            
      #   }
      
      # }

      # httpd = {
      #   name   = "httpd"
      #   image  = "httpd"
      #   cpu    = "0.5"
      #   memory = "0.3"

      #   ports = {
      #     80 = {
      #       port     = 80
      #       protocol = "TCP"
      #     }
      #     22 = {
      #       port     = 22
      #       protocol = "TCP"
      #     }            
      #   }
      
      # }

      # sample

      # aci1 = {
      #   name   = "aci-helloworld"
      #   image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
      #   cpu    = "0.5"
      #   memory = "1.5"

      #   ports = {
      #     80 = {
      #       port     = 80
      #       protocol = "TCP"
      #     }                            
      #   }
      
      # }      

      webserver = {
        name   = "nodejs"
        image  = "nginx" # docker pull hello-world
        cpu    = "0.5"
        memory = "1.5"

        ports = {
          80 = {
            port     = 80
            protocol = "TCP"
          }          
          22 = {
            port     = 22
            protocol = "TCP"
          }
        }

        # for demo purposes
        environment_variables = {
          URL = "https://www.microsoft.com"
        }
        secure_environment_variables = {
          TOKEN = "token from tfvars"
        }
        environment_variables_from_resources = {
          AGENT_KEYVAULT_NAME = {
            output_key    = "keyvaults"
            resource_key  = "secrets"
            attribute_key = "name"
          }
          MSI_ID = {
            output_key    = "managed_identities"
            resource_key  = "nginx"
            attribute_key = "id"
          }
        }
      }

    } //containers

    tags = {
      environment = "testing"
    }

    identity = {
      type = "UserAssigned" // Possible options are 'SystemAssigned, UserAssigned' 'SystemAssigned' or 'UserAssigned'
      managed_identity_keys = [
        "nginx"
      ]
    } // identity

  } //nginx

  # httpd = {
  #   name               = "httpd"
  #   region             = "region1"
  #   resource_group_key = "container_groups_re1"
  #   ip_address_type    = "Public"
  #   os_type            = "Linux"
  #   restart_policy     = "Never" // Possible values are 'Always'(default) 'Never' 'OnFailure'

  #   containers = {

  #     # You can also deploy the name container multiple times based on the count number
  #     httpd = {
  #       name   = "httpd"
  #       image  = "httpd"
  #       cpu    = "0.5"
  #       memory = "0.3"

  #       ports = {
  #         80 = {
  #           port     = 80
  #           protocol = "TCP"
  #         }
  #       }
  #     }

  #   } //containers

  #   tags = {
  #     environment = "testing"
  #   }

  # } //httpd

}
