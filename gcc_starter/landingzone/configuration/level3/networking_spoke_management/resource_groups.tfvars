
resource_groups = {
  # Default to var.global_settings.default_region. You can overwrite it by setting the attribute region = "region2"
  networking_spoke_re1 = {
    name   = "networking-spoke-management-re1"

    tags = { 
      purpose = "management networking spoke resource groups" 
      project-code = "ignite" 
      env = "sandpit" 
      zone = "management"        
    } 
  }

}


