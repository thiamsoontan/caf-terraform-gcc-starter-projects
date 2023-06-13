resource_groups = {
  networking_firewall_re1 = {
    name   = "networking-firewall-re1"
    region = "region1"
    tags = { 
      purpose = "ingress networking spoke resource group" # replace with purpose
      project-code = "cep" # replace with project code 
      env = "sandpit" # replace with project env
      zone = "cep" # replace with zone   
    }      
  }
}
