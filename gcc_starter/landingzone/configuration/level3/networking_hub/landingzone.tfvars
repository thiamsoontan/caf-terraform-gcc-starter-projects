landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level3"
  key                 = "networking_hub_ingress_egress" 
  tfstates = {
    launchpad = {
      level   = "lower"
      tfstate = "caf_launchpad.tfstate" # set to launchpad tfstate name
    } 
    shared_services = {
      level   = "current"
      tfstate = "shared_services.tfstate" # set to referenced landingzone tfstate name      
    }    
  }
}
