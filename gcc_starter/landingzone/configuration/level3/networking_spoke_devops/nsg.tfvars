# TODO: 20221012 update the detail in nsg
#
# Definition of the networking security groups
#
network_security_group_definition = {
  # This entry is applied to all subnets with no NSG defined
  empty_nsg = {
    version            = 1
    resource_group_key = "networking_spoke_re1"
    name               = "empty"
    nsg = []
  }

  # devops runner
  runner_nsg = {
    version            = 1
    resource_group_key = "networking_spoke_re1"
    name               = "runner"   
    tags = { 
      purpose = "devops runner network security group"
      project-code = "gcf" 
      env = "sandpit" 
      zone = "devops"     
    }     
    flow_logs = {
      name    = "runner-nsg-devops" 
      version = 2
      enabled = true
      storage_account = {
        storage_account_destination = "all_regions" # refer to value in shared services diagnostic_storage_accounts storage all_regions 
        retention = {
          enabled = true
          days    = 365
        }
      }
    }        
    nsg = [
      {
        name                       = "ssh-inbound-22",
        priority                   = "100"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "VirtualNetwork"
      },      
      {
        name                       = "out-communication-allow-443",
        priority                   = "110"
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "VirtualNetwork"
        destination_address_prefix = "VirtualNetwork"
      },
    ]
  }  
}
