diagnostic_storage_accounts = {

  central_nsg_flow_logs_sa_re1 = {
    name                     = "diaglogsre1mz"
    region                   = "region1"
    resource_group_key       = "networking_spoke_re1"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    access_tier              = "Hot"
    
    tags = { 
      purpose = "management diagnostic storage accounts" 
      project-code = "ignite" 
      env = "sandpit" 
      zone = "management"        
    }       
  }
}

## destinations definition
diagnostics_destinations = {
  storage = {
    all_regions = {
      southeastasia = {
        storage_account_key = "central_nsg_flow_logs_sa_re1"
      }
    }
  }
}