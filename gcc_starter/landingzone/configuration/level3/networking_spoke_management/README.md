
rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/networking_spoke_management \
-parallelism 30 \
-env sandpit \
-tfstate networking_spoke_management.tfstate \
-a plan

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/networking_spoke_management \
-parallelism 30 \
-env sandpit \
-tfstate networking_spoke_management.tfstate \
-a apply

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/networking_spoke_management \
-parallelism 30 \
-env sandpit \
-tfstate networking_spoke_management.tfstate \
-a destroy






# apim nsg
https://docs.microsoft.com/en-us/azure/api-management/api-management-using-with-vnet?tabs=stv2