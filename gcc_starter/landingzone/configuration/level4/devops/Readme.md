
rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level4 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level4/devops \
-parallelism 30 \
-env sandpit \
-tfstate solution_accelerators_devops.tfstate \
-a plan

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level4 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level4/devops \
-parallelism 30 \
-env sandpit \
-tfstate solution_accelerators_devops.tfstate \
-a apply

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level4 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level4/devops \
-parallelism 30 \
-env sandpit \
-tfstate solution_accelerators_devops.tfstate \
-a destroy
