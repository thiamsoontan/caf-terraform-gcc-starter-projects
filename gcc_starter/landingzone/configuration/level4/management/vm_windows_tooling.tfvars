

# storage_accounts = {
#   sa1 = {
#     name               = "sa1"
#     resource_group_key = "vm_windows_tooling_re1"
#     # Account types are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2
#     #account_kind = "BlobStorage"
#     # Account Tier options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
#     account_tier = "Standard"
#     #  Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS
#     account_replication_type = "LRS" # https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy
#     containers = {
#       files = {
#         name = "files"
#       }
#     }

#     network = {
#       bypass   = ["Logging", "Metrics"]         #optional. Valid options are any combination of Logging, Metrics, AzureServices, or None
#       ip_rules = ["116.86.27.243", "100.1.1.1"] #optional. The prefix of ip_rules must be between 0 and 30 and only supports public IP addresses.
#       subnets = {
#         subnet1 = {
#           remote_subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-management/subnets/cep-snet-infra-management"

#           # #lz_key = ""
#           # vnet_key   = "vnet1"
#           # subnet_key = "subnet1"
#           #remote_subnet_id = "/subscriptions/*******/resourceGroups/*******/providers/Microsoft.Network/virtualNetworks/vnet-some-remote-vnet/subnets/snet-remote-subnet"
#         }
#         #add multiple subnets by extending this block. You can reference remote subnets by using remote_subnet_id
#         #subnet2 = {
#         #remote_subnet_id = "/subscriptions/*******/resourceGroups/*******/providers/Microsoft.Network/virtualNetworks/vnet-some-remote-vnet/subnets/snet-remote-subnet"
#       }

#     }


#   }
# }

# pre-create the blog storage and put the script there and use extension to in the script to pull the file over
# unzip the files in c:\wip and execute the script in the files
# Upload helloworld scripts - need to fixed the path 
# storage_account_blobs = {
#   script1 = {
#     name                   = "helloworld.sh"
#     storage_account_key    = "sa1"
#     storage_container_name = "files"
#     source                 = "/tf/caf/gcc_starter/landingzone/configuration/level4/vm_windows/scripts/helloworld.sh"
#     parallelism            = 1
#   }
#   script2 = {
#     name                   = "helloworld.ps1"
#     storage_account_key    = "sa1"
#     storage_container_name = "files"
#     source                 = "/tf/caf/gcc_starter/landingzone/configuration/level4/vm_windows/scripts/helloworld.ps1"
#     parallelism            = 1
#   }
# }

# give managed identity Storage Blob Data reader and executing user Storage Blob Data Contributor permissions on storage account
# role_mapping = {
#   built_in_role_mapping = {
#     storage_accounts = {
#       sa1 = {
#         "Storage Blob Data Reader" = {
#           managed_identities = {
#             keys = ["user_mi"]
#           }
#         }
#         # Sandpit does not have permission to create this
#         "Storage Blob Data Contributor" = {
#           logged_in = {
#             keys = ["user"]
#           }
#         }
#       }
#     }
#   }
# }

# Virtual machines
virtual_machines = {

  # Configuration to deploy a bastion host windows virtual machine
  win_vm1 = {
    resource_group_key = "vm_windows_tooling_re1"
    provision_vm_agent = true
    # when boot_diagnostics_storage_account_key is empty string "", boot diagnostics will be put on azure managed storage
    # when boot_diagnostics_storage_account_key is a non-empty string, it needs to point to the key of a user managed storage defined in diagnostic_storage_accounts
    # if boot_diagnostics_storage_account_key is not defined, but global_settings.resource_defaults.virtual_machines.use_azmanaged_storage_for_boot_diagnostics is true, boot diagnostics will be put on azure managed storage

    os_type = "windows"

    # the auto-generated ssh key in keyvault secret. Secret name being {VM name}-ssh-public and {VM name}-ssh-private
    keyvault_key = "kv1_vm"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        # Value of the keys from networking.tfvars
        #vnet_key                = "vnet_region1"
        #subnet_key              = "example"
        # management infra subnet        
        subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-management/subnets/ref1-snet-infra-management"
        name                    = "0"
        enable_ip_forwarding    = false
        internal_dns_name_label = "nic0"
        # public_ip_address_key   = "example_vm_pip1_rg1"
      }
    }

    # virtual_machine_extensions = {
    #   custom_script = {
    #     #fileuris            = ["https://somelocation/container/script.ps1"]
    #     # can define fileuris directly or use fileuri_sa_ reference keys and lz_key:
    #     fileuri_sa_key   = "sa1"
    #     fileuri_sa_path  = "files/helloworld.ps1"
    #     commandtoexecute = "PowerShell -file helloworld.ps1"
    #     # managed_identity_id = optional to define managed identity principal_id directly
    #     identity_type        = "UserAssigned" #optional to use managed_identity for download from location specified in fileuri, UserAssigned or SystemAssigned.
    #     managed_identity_key = "user_mi"
    #     #lz_key               = "other_lz" optional for managed identity defined in other lz
    #   }
    # }
    virtual_machine_settings = {
      windows = {
        name = "win1"
        size = "standard_d2_v2"

        # TODO: pull from blob storage to c:\wip, execute this script file projectcode-custom-data.ps1
        #custom_data - Users can either reference a local file path or a block of code as seen below.
        # custom_data                     = "scripts/cloud-init/install-rover-tools.config"
        custom_data = <<CUSTOM_DATA
#!/bin/bash
echo "Execute your super awesome commands here!"
CUSTOM_DATA

        admin_username = "adminuser"
        # Spot VM to save money
        #priority        = "Spot"
        #eviction_policy = "Deallocate"

        # Value of the nic keys to attach the VM. The first one in the list is the default nic
        network_interface_keys = ["nic0"]

        os_disk = {
          name                 = "windows_vm1-os"
          caching              = "ReadWrite"
          storage_account_type = "Standard_LRS"
          managed_disk_type    = "StandardSSD_LRS"
          disk_size_gb         = "128"
          create_option        = "FromImage"
        }

        source_image_reference = {
          publisher = "MicrosoftWindowsServer"
          offer     = "WindowsServer"
          sku       = "2019-Datacenter"
          version   = "latest"
        }
        identity = {
          type                  = "UserAssigned"
          managed_identity_keys = ["user_mi"]
        }
      }
    }
  }


#   win_vm2 = {
#     resource_group_key = "vm_windows_tooling_re1"
#     provision_vm_agent = true
#     # when boot_diagnostics_storage_account_key is empty string "", boot diagnostics will be put on azure managed storage
#     # when boot_diagnostics_storage_account_key is a non-empty string, it needs to point to the key of a user managed storage defined in diagnostic_storage_accounts
#     # if boot_diagnostics_storage_account_key is not defined, but global_settings.resource_defaults.virtual_machines.use_azmanaged_storage_for_boot_diagnostics is true, boot diagnostics will be put on azure managed storage

#     os_type = "windows"

#     # the auto-generated ssh key in keyvault secret. Secret name being {VM name}-ssh-public and {VM name}-ssh-private
#     keyvault_key = "example_vm_rg1"

#     # Define the number of networking cards to attach the virtual machine
#     networking_interfaces = {
#       nic1 = {
#         # Value of the keys from networking.tfvars
#         #vnet_key                = "vnet_region1"
#         #subnet_key              = "example"
#         # management infra subnet        
#         # subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-app-internet"
#         subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-app-aks-internet"
#         name                    = "1" # name of nic - use "single" character to name it
#         enable_ip_forwarding    = false
#         internal_dns_name_label = "nic1"
#         # public_ip_address_key   = "example_vm_pip1_rg1"
#       }
#     }

#     # virtual_machine_extensions = {
#     #   custom_script = {
#     #     #fileuris            = ["https://somelocation/container/script.ps1"]
#     #     # can define fileuris directly or use fileuri_sa_ reference keys and lz_key:
#     #     fileuri_sa_key   = "sa1"
#     #     fileuri_sa_path  = "files/helloworld.ps1"
#     #     commandtoexecute = "PowerShell -file helloworld.ps1"
#     #     # managed_identity_id = optional to define managed identity principal_id directly
#     #     identity_type        = "UserAssigned" #optional to use managed_identity for download from location specified in fileuri, UserAssigned or SystemAssigned.
#     #     managed_identity_key = "user_mi"
#     #     #lz_key               = "other_lz" optional for managed identity defined in other lz
#     #   }
#     # }
#     virtual_machine_settings = {
#       windows = {
#         name = "win_cse2"
#         size = "standard_d2_v2"

#         # TODO: pull from blob storage to c:\wip, execute this script file projectcode-custom-data.ps1
#         #custom_data - Users can either reference a local file path or a block of code as seen below.
#         # custom_data                     = "scripts/cloud-init/install-rover-tools.config"
#         custom_data = <<CUSTOM_DATA
# #!/bin/bash
# echo "Execute your super awesome commands here!"
# CUSTOM_DATA

#         admin_username = "adminuser"
#         # Spot VM to save money
#         #priority        = "Spot"
#         #eviction_policy = "Deallocate"

#         # Value of the nic keys to attach the VM. The first one in the list is the default nic
#         network_interface_keys = ["nic1"]

#         os_disk = {
#           name                 = "windows_vm2-os"
#           caching              = "ReadWrite"
#           storage_account_type = "Standard_LRS"
#           managed_disk_type    = "StandardSSD_LRS"
#           disk_size_gb         = "128"
#           create_option        = "FromImage"
#         }

#         source_image_reference = {
#           publisher = "MicrosoftWindowsServer"
#           offer     = "WindowsServer"
#           sku       = "2019-Datacenter"
#           version   = "latest"
#         }
#         identity = {
#           type                  = "UserAssigned"
#           managed_identity_keys = ["user_mi"]
#         }
#       }
#     }
#   }

  # linux_vm1 = {
  #   resource_group_key = "vm_windows_tooling_re1"
  #   provision_vm_agent = true
  #   # when boot_diagnostics_storage_account_key is empty string "", boot diagnostics will be put on azure managed storage
  #   # when boot_diagnostics_storage_account_key is a non-empty string, it needs to point to the key of a user managed storage defined in diagnostic_storage_accounts
  #   # if boot_diagnostics_storage_account_key is not defined, but global_settings.resource_defaults.virtual_machines.use_azmanaged_storage_for_boot_diagnostics is true, boot diagnostics will be put on azure managed storage
  #   #boot_diagnostics_storage_account_key = "bootdiag_region1"

  #   os_type = "linux"

  #   # the auto-generated ssh key in keyvault secret. Secret name being {VM name}-ssh-public and {VM name}-ssh-private
  #   keyvault_key = "example_vm_rg1"

  #   # Define the number of networking cards to attach the virtual machine
  #   # Option to use when BYOI (Bring your Own Interface)
  #   # networking_interface_ids = ["/subscriptions/<subid>/resourceGroups/<rg-name>/providers/Microsoft.Network/networkInterfaces/<nicID>"]

  #   networking_interfaces = {
  #     nic0 = {
  #       # Value of the keys from networking.tfvars
  #       #vnet_key                = "vnet_region1"
  #       #subnet_key              = "example"
  #       subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/ignite-vnet-spoke-management-re1/subnets/ignite-snet-infra-management"
  #       primary                 = true
  #       name                    = "1"
  #       enable_ip_forwarding    = false
  #       internal_dns_name_label = "nic1"
  #       #public_ip_address_key   = "example_vm_pip1_rg1"
  #       # example with external network objects
  #       # subnet_id = "/subscriptions/sub-id/resourceGroups/test-manual/providers/Microsoft.Network/virtualNetworks/vnet/subnets/default"
  #       # public_address_id = "/subscriptions/sub-id/resourceGroups/test-manual/providers/Microsoft.Network/publicIPAddresses/arnaudip"
  #       # nsg_id = "/subscriptions/sub-id/resourceGroups/test-manual/providers/Microsoft.Network/networkSecurityGroups/nsgtest"

  #     }
  #   }

  #   virtual_machine_settings = {
  #     linux = {
  #       name                            = "linux_cse"
  #       size                            = "Standard_F2"
  #       admin_username                  = "adminuser"
  #       disable_password_authentication = true

  #       # Spot VM to save money
  #       #priority        = "Spot"
  #       #eviction_policy = "Deallocate"

  #       # Value of the nic keys to attach the VM. The first one in the list is the default nic
  #       network_interface_keys = ["nic0"]

  #       os_disk = {
  #         name                 = "linux_vm1-os"
  #         caching              = "ReadWrite"
  #         storage_account_type = "Standard_LRS"
  #       }
  #       identity = {
  #         type                  = "UserAssigned"
  #         managed_identity_keys = ["user_mi"]
  #       }
  #       source_image_reference = {
  #         publisher = "Canonical"
  #         offer     = "UbuntuServer"
  #         sku       = "18.04-LTS"
  #         version   = "latest"
  #       }
  #     }
  #   }
  #   virtual_machine_extensions = {
  #     custom_script = {
  #       # You can define fileuris directly or use fileuri_sa reference keys and lz_key:
  #       # fileuris                  = ["https://somelocation/container/script.ps1"]
  #       fileuri_sa_key            = "sa1"
  #       fileuri_sa_path           = "files/helloworld.sh"
  #       commandtoexecute          = "bash helloworld.sh"
  #       identity_type             = "UserAssigned" # optional to use managed_identity for download from location specified in fileuri, UserAssigned or SystemAssigned.
  #       managed_identity_key      = "user_mi"
  #       automatic_upgrade_enabled = false
  #       # managed_identity_id       = "id" # optional to define managed identity principal_id directly
  #       # lz_key                    = "other_lz" # optional for managed identity defined in other lz
  #     }
  #   }
  # }  
}



# vnets = {
#   vnet_region1 = {
#     resource_group_key = "vm_windows_tooling_re1"
#     vnet = {
#       name          = "virtual_machines"
#       address_space = ["10.100.100.0/24"]
#     }
#     subnets = {
#       example = {
#         name = "examples"
#         cidr = ["10.100.100.0/29"]
#       }
#     }

#   }
# }

# vm should not have a public IP in GCC.
# public_ip_addresses = {
#   example_vm_pip1_rg1 = {
#     name               = "example_vm_pip1_rg1"
#     resource_group_key = "vm_windows_tooling_re1"
#     sku                = "Basic"
#     # Note: For UltraPerformance ExpressRoute Virtual Network gateway, the associated Public IP needs to be sku "Basic" not "Standard"
#     allocation_method = "Dynamic"
#     # allocation method needs to be Dynamic
#     ip_version              = "IPv4"
#     idle_timeout_in_minutes = "4"
#   }
# }