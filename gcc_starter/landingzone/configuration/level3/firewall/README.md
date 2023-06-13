
rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/firewall \
-parallelism 30 \
-env sandpit \
-tfstate networking_firewall.tfstate \
-a plan


rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/firewall \
-parallelism 30 \
-env sandpit \
-tfstate networking_firewall.tfstate \
-a apply

rover -lz rover -lz /tf/caf/landingzones/caf_solution \
-level level3 \
-var-folder /tf/caf/gcc_starter/landingzone/configuration/level3/firewall \
-parallelism 30 \
-env sandpit \
-tfstate networking_firewall.tfstate \
-a destroy


