
rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/networking_spoke_devops \
-parallelism 30 \
-env sandpit \
-tfstate networking_spoke_devops.tfstate \
-a plan

rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/networking_spoke_devops \
-parallelism 30 \
-env sandpit \
-tfstate networking_spoke_devops.tfstate \
-a apply

rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/networking_spoke_devops \
-parallelism 30 \
-env sandpit \
-tfstate networking_spoke_devops.tfstate \
-a destroy






# apim nsg
https://docs.microsoft.com/en-us/azure/api-devops/api-devops-using-with-vnet?tabs=stv2