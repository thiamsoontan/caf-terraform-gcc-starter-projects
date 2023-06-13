landingzone = {
  backend_type        = "azurerm"
  level               = "level4"
  key                 = "solution_accelerators_devops"      
  global_settings_key = "shared_services" 
  tfstates = {
    shared_services = {
      level   = "lower"
      tfstate = "shared_services.tfstate"      
    }
    networking_spoke = {
      level   = "lower"
      tfstate = "networking_spoke_devops.tfstate"       
    }    
  }
}
