
# https://docs.microsoft.com/en-us/azure/storage/
storage_accounts = {

  # function apps
  sa1 = {
    name               = "funappsa1"
    resource_group_key = "function_app_re1"
    region             = "region1"

    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    containers = {
      dev = {
        name = "random"
      }
    }

  }

  fa_sa2 = {
    name               = "funappsa2"
    resource_group_key = "function_app_re1"
    region             = "region1"

    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    containers = {
      dev = {
        name = "random"
      }
    }

  }  

  # blob and queues
  sa2 = {
    name               = "blobqueues"
    resource_group_key = "storage_accounts_re1"
    # Account types are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2
    account_kind = "StorageV2" # "BlobStorage"
    # Account Tier options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    account_tier = "Standard"
    #  Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS
    account_replication_type = "LRS" # https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy
    tags = {
      environment = "dev"
      team        = "IT"
      ##
    }
    network = {
      bypass   = ["Logging", "Metrics"]         #optional. Valid options are any combination of Logging, Metrics, AzureServices, or None
      # ip_rules = ["172.16.2.0","116.86.27.243", "100.1.1.1"] #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
      subnets = {
        subnet1 = {
          remote_subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-db-internet"
        }        
      
      }

    }
  }
}




