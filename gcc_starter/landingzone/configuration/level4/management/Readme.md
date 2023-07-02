

# TODO: Update the module code to make it work for gcc
# 28 Sep 2022 - thiamsoon
# remarks: add in "subnet_id" attribute to accept "subnet_id" variable
# file: /tf/caf/landingzones/aztfmod/bastion_service.tf
# line 40
# ----------------------------------------------------------------------------------------
  ip_configuration {
    name                 = each.value.name
    # subnet_id            = local.combined_objects_networking[try(each.value.vnet.lz_key, local.client_config.landingzone_key)][try(each.value.vnet.vnet_key, each.value.vnet_key)].subnets[try(each.value.vnet.subnet_key, each.value.subnet_key)].id
    # 28 Sep 2022 - thiamsoon
    # remarks: add in "subnet_id" attribute to accept "subnet_id" variable
    subnet_id            = can(each.value.subnet_id) ? each.value.subnet_id : local.combined_objects_networking[try(each.value.vnet.lz_key, local.client_config.landingzone_key)][try(each.value.vnet.vnet_key, each.value.vnet_key)].subnets[try(each.value.vnet.subnet_key, each.value.subnet_key)].id
    public_ip_address_id = can(each.value.public_ip.id) ? each.value.public_ip.id : local.combined_objects_public_ip_addresses[try(each.value.public_ip.lz_key, local.client_config.landingzone_key)][try(each.value.public_ip.key, each.value.public_ip_key, each.value.public_ip.public_ip_key)].id
  }

# ----------------------------------------------------------------------------------------

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level4 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level4/management \
-parallelism 30 \
-env sandpit \
-tfstate solution_accelerators_management.tfstate \
-a plan

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level4 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level4/management \
-parallelism 30 \
-env sandpit \
-tfstate solution_accelerators_management.tfstate \
-a apply

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level4 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level4/management \
-parallelism 30 \
-env sandpit \
-tfstate solution_accelerators_management.tfstate \
-a destroy






# apim nsg
https://docs.microsoft.com/en-us/azure/api-management/api-management-using-with-vnet?tabs=stv2