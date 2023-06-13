#
# Reference Example: /tf/caf/landingzones/aztfmod/examples/app_gateway/301-agw-v1
#
# You can deploy Application Gateway with Public IP and Private IP. All you need to do is to create the listener with the private Frontend IP and leave the Public IP as such.
# Since Public IP is not attached with any of the listener, no one will be able to access your site from Internet via Public IP of your Application Gateway.
# 1. agw must deploy inside s01-rg-aks-nodes-re1 or 
# 2. grant permission ingressapplicationgateway-s01-aks-cluster-re1 and s01-msi-aks-usermsi to s01-rg-aks-re1 resource group
#
application_gateway_platforms = {
  reverse_proxy_agw_re1 = {
    resource_group = {
      key = "agw_rg_re1"
    }
    name      = "reverse-proxy" 
    # subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/s01-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/s01-vnet-spoke-internet-re1/subnets/s01-snet-web-internet"
    subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-web-internet"
    sku_name  = "WAF_v2"
    sku_tier  = "WAF_v2"
    capacity = {
      autoscale = {
        minimum_scale_unit = 1
        maximum_scale_unit = 5
      }
    }

    # add the waf policy
    waf_policy = {
      key = "agw_wp_re1" 
    }

    # can add "2", "3" if needed
    zones        = ["3"] # ["1", "2", "3"]
    enable_http2 = true

    # enable ssl_policy if required
    #ssl_policy = {
    #  policy_name = "AppGwSslPolicy20170401S"
    #  policy_type = "Predefined"
    #}    

    identity = {
      managed_identity_keys = ["apgw_keyvault_secrets"] # TODO: is this key correct????
      # remote = {                      # Use that block to reference a remote user MSI
      #   "value of the lz_key" = {
      #     managed_identity_keys = [
      #       "agw"
      #     ]
      #   }
      # }    
    }

    front_end_ip_configurations = {
      public = {
        name          = "public"     
        public_ip_key = "agw_pip_re1"
      }
      private = {
        name = "private"
        # subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/s01-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/s01-vnet-spoke-internet-re1/subnets/s01-snet-web-internet"
        subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-web-internet"
        subnet_cidr = "172.16.0.0/24" # set the web subnet cidr range - hardcoded here         
        subnet_cidr_index = 0  # It is possible to have more than one cidr block per subnet
        private_ip_offset = 4 # e.g. cidrhost(10.10.0.0/25,4) = 10.10.0.4 => AGW private IP address
        private_ip_address_allocation = "Static"
      }
    }

    # set the ssl certs if required
    # ssl_certs = {
    #   default = {
    #     name = "default"
    #     keyvault = {
    #       # lz_key           = ""
    #       key              = "certificates"
    #       certificate_name = "default-domain-name-com" # As is line 7 on the certificates.tfvars
    #     }
    #   }
    # }

    front_end_ports = {
      80 = {
        name     = "http"
        port     = 80
        protocol = "Http"
      }
      443 = {
        name     = "https"
        port     = 443
        protocol = "Https"
      }
    }

    # TODO: https listener, use keyvault for certification

    # default: wont be able to change after creation as this is required for agw tf resource
    default = {
      frontend_port_key             = "80" # change to 443 when using ssl_certs
      frontend_ip_configuration_key = "private"
      backend_address_pool_name     = "default-beap"
      http_setting_name             = "default-be-htst"
      listener_name                 = "default-httplstn"
      request_routing_rule_name     = "default-rqrt"
      cookie_based_affinity         = "Disabled"
      request_timeout               = "60"
      rule_type                     = "Basic"
    }


    # TODO: debug the diagnostic_profiles
    # you can setup up to 5 key
    # diagnostic_profiles = {
    #   central_logs_region1 = {
    #     definition_key   = "application_gateway"
    #     destination_type = "log_analytics"
    #     destination_key  = "central_logs"
    #   }
    # }

    tags = { 
      purpose = "internet web reverse proxy application gateway" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "web"          
    } 

  }
}

