# resource_groups = {
#   acr_rg_re1 = {
#     name = "acr-re1"           
#     region = "region1"    
#     tags = { 
#       purpose = "management acr resource group" 
#       project-code = "ignite" 
#       env = "sandpit" 
#       zone = "management"
#       tier = ""          
#     }      
#   }
# }

resource_groups = {
  # Default to var.global_settings.default_region. You can overwrite it by setting the attribute region = "region2"
  acr_region1 = {
    name = "acr"
  }
  vnet_region1 = {
    name = "acr-vnet"
  }
}