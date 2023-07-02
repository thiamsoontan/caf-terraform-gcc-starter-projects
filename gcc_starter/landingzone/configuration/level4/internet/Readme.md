# Note: 
# Terraform code unable to set the Stack setting
# after azure function app is created, go to function app | Configuration | General setting to set the Stack settings

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level4 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level4/internet \
-parallelism 30 \
-env sandpit \
-tfstate solution_accelerators_internet.tfstate \
-a plan

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level4 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level4/internet \
-parallelism 30 \
-env sandpit \
-tfstate solution_accelerators_internet.tfstate \
-a apply

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level4 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level4/internet \
-parallelism 30 \
-env sandpit \
-tfstate solution_accelerators_internet.tfstate \
-a destroy





