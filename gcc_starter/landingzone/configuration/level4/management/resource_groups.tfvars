resource_groups = {
  bastion_rg_re1 = {
    name = "bastion-host-re1"           
    region = "region1"    
    tags = { 
      purpose = "management bastion resource group" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "management"
      tier = ""          
    }    
  }

  vm_windows_tooling_re1 = {
    name = "vm-windows-tooling-re1"
    region = "region1"      
    tags = { 
      purpose = "internet vm tooling server resource group" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "internet"
      tier = "web"          
    }    
  }  
}