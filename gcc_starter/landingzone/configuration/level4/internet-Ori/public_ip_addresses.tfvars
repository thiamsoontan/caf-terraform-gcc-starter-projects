# web tier do not have public ip
public_ip_addresses = {
  agw_pip_re1 = {
    name                    = "agw-pip-re1"
    resource_group_key      = "agw_rg_re1"
    sku                     = "Standard"
    allocation_method       = "Static"
    ip_version              = "IPv4"
    zones                   = ["3"] # ["1", "2", "3"]
    idle_timeout_in_minutes = "4"

    tags = { 
      purpose = "internet agw public ip address" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "web"          
    } 
  }

  # agw1_pip_re1 = {
  #   name                    = "agw1-pip-re1"
  #   resource_group_key      = "agw_rg_re1"
  #   sku                     = "Standard"
  #   allocation_method       = "Static"
  #   ip_version              = "IPv4"
  #   zones                   = ["3"]
  #   idle_timeout_in_minutes = "4"

  #   tags = { 
  #     purpose = "{{zone_code}} agw public ip address" 
  #     project-code = "{{project_code}}" 
  #     env = "{{caf_environment}}" 
  #     zone = "{{zone_code}}"
  #     tier = "{{tier_code}}"          
  #   } 
  # }
}

