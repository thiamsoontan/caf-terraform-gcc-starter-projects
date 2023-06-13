
rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/shared_services \
-parallelism 30 \
-env sandpit \
-skip-permission-check \
-tfstate shared_services.tfstate \
-a plan

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/shared_services \
-parallelism 30 \
-env sandpit \
-tfstate shared_services.tfstate \
-a apply

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/shared_services \
-parallelism 30 \
-env sandpit \
-tfstate shared_services.tfstate \
-a destroy
