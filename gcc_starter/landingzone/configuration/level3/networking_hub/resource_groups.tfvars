
resource_groups = {
  # Default to var.global_settings.default_region. You can overwrite it by setting the attribute region = "region2"
  networking_firewall_ingress_re1 = {
    name   = "networking-hub-re1"
    # name   = "gcci-rg-agency-vnets"

    tags = { 
      purpose = "networking firewall ingress resource group" 
      project-code = "ignite" 
      env = "sandpit" 
      zone = "internet"        
    }  
  }

}


