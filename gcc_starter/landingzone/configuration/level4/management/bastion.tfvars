# 28 Sep 2022 - thiamsoon
# remarks: add in "subnet_id" attribute to accept "subnet_id" variable
# file: /tf/caf/landingzones/aztfmod/bastion_service.tf
# line 40
bastion_hosts = {
  bastion_hub_re1 = {
    name               = "bastion-host"
    region             = "region1"
    resource_group_key = "bastion_rg_re1"
    subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-management/subnets/AzureBastionSubnet"
    public_ip_key      = "bastion_host_pip_re1"

    tags = { 
      purpose = "management bastion host" 
      project-code = "cep" 
      env = "sandpit" 
      zone = "management"
      tier = ""          
    }  

    # you can setup up to 5 key
    diagnostic_profiles = {
      central_logs_region1 = {
        definition_key   = "bastion_host"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
    }

  }

}