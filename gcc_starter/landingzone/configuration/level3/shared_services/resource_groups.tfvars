resource_groups = {
  ops_rg_re1 = {
    name   = "ops-re1"
    region = "region1"
    tags = { 
      purpose = "shared services resource groups" 
      project-code = "ignite" 
      env = "sandpit" 
      zone = "internet"        
    }   
  }
}