# TODO: test private endpoint

cosmos_dbs = {
  cosmosdb_account_re1 = {
    name                      = "cosmosdb_acc"
    resource_group_key        = "cosmodb_re1"
    offer_type                = "Standard"
    kind                      = "GlobalDocumentDB"
    enable_automatic_failover = "true"

    consistency_policy = {
      consistency_level       = "BoundedStaleness"
      max_interval_in_seconds = "300"
      max_staleness_prefix    = "100000"
    }
    # Primary location (Write Region)
    geo_locations = {
      primary_geo_location = {
        prefix            = "customid-101"
        region            = "region1"
        zone_redundant    = false
        failover_priority = 0
      }
      # failover location
      #failover_geo_location = {
      #  location          = "francecentral"
      #  failover_priority = 1
      #}
    }

    # Optional - private endpoint
    private_endpoints = {
      # Require enforce_private_link_endpoint_network_policies set to true on the subnet
      cosmos_db_pe1 = {
        name               = "cosmos-private-endpoint"
        resource_group_key = "cosmodb_re1"

        # lz_key     = ""
        #vnet_key   = "vnet_region1"
        #subnet_key = "cosmosdb_subnet"
        # subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/s01-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/s01-vnet-spoke-internet-re1/subnets/s01-snet-db-internet",
        subnet_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-vnets/providers/Microsoft.Network/virtualNetworks/gcci-vnet-internet/subnets/cep-snet-db-internet"

        private_service_connection = {
          name                 = "cosmos-private-link"
          is_manual_connection = false
          subresource_names    = ["Sql"]
        }

        private_dns = {
          zone_group_name = "cosmosdb-private-dns-zone"
          # lz_key          = ""
          keys = ["cosmos_dns"]
        }
      }
    }    

    # Optional
    enable_free_tier = false
    #ip_range_filter  = "116.88.85.63,116.88.85.64"
    #capabilities              = ["EnableTable"]
    enable_multiple_write_locations = false
    tags = {
      "project" = "CEP"
    }

    # [optional] - Other DB API supoorted - MongoDB, Table, Gramlin GraphDB
    sql_databases = {
      databases_re1 = {
        # when set to 'true' it will append random generated integer to sql database
        # defaults to 'true'
        # add_rnd_num = true
        name       = "cosmos-sql-exdb"
        throughput = 400
        #autoscale_settings = {
        #      max_throughput = 4000
        #}

        containers = {
          container1 = {
            name               = "container-ex101"
            throughput = 400
            partition_key_path = "/partitionKeyPath"

            unique_key = {
              paths = ["/uniquePath1", "/uniquePath2"]
            }

            #autoscale_settings = {
            #  max_throughput = 4000
            #}

            indexing_policy = {
              included_paths = {
                path1 = "/*"
              }

              excluded_paths = {
                path1 = "/excludedPath/?"
              }

              spatial_indexes = {
                path1 = "/spatialIndexPath1/?"
                path2 = "/spatialIndexPath2/?"
              }

              composite_indexes = {
                composite_index1 = {
                  index1 = {
                    path  = "/indexPath1"
                    order = "Descending"
                  }
                  index2 = {
                    path  = "/indexPath2"
                    order = "Descending"
                  }
                }

                composite_index2 = {
                  index1 = {
                    path  = "/indexPath1"
                    order = "Ascending"
                  }
                  index2 = {
                    path  = "/indexPath2"
                    order = "Ascending"
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}