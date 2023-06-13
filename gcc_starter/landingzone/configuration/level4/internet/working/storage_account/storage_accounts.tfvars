# https://docs.microsoft.com/en-us/azure/storage/
storage_accounts = {
  sa1 = {
    name                     = "sa1dev"
    resource_group_key       = "test"
    account_kind             = "BlobStorage"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
      team        = "IT"
    }
    containers = {
      dev = {
        name = "random"
      }
    }

    enable_system_msi = true

    diagnostic_profiles = {
      central_logs_region1 = {
        name             = "log_and_metrics_log_analytics"
        definition_key   = "storage"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
      dsa1 = {
        name             = "log_and_metrics_log_storage"
        definition_key   = "storage"
        destination_type = "storage"
        destination_key  = "all_regions"
      }
    }

    diagnostic_profiles_blob = {
      central_logs_region1 = {
        name             = "log_and_metrics_log_analytics"
        definition_key   = "storage_blob"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
      dsa1 = {
        name             = "log_and_metrics_log_storage"
        definition_key   = "storage_blob"
        destination_type = "storage"
        destination_key  = "all_regions"
      }
    }


    # TODO: add private_endpoints
    private_endpoints = {
      pep_sa1 = {
        name               = "sa1-private-link"
        resource_group_key = "test" # "vnet_region1"
        # TODO: change to subnet_id
        # vnet_key           = "hub_rg1"
        # subnet_key         = "jumphost"
        subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/ref1-snet-app-internet"

        private_service_connection = {
          name                 = "sa1-private-link"
          is_manual_connection = false
          subresource_names    = ["blob"]
        }

      }
    }


  }
}
