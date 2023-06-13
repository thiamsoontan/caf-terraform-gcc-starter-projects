## Pre-requisites

login account must be the owner of the subscription when creating the launchpad
purge all deleted key vaults before apply the launchpad

## Deployment

# msdn subscrition
e22a351f-db36-4a02-9793-0f2189d5f3ab

# login to sandpit tenant
rover login  --tenant ac20add1-ffda-45c1-adc5-16a0db15810f

# sandpit tenant - must use this to login
az login --tenant ac20add1-ffda-45c1-adc5-16a0db15810f

# CEP subscription
az account set --subscription 6f035180-4066-42f0-b0fa-5fbc1ae67500

# Forum subscription
az account set --subscription 4d943279-dcc7-4b40-83b7-b7ce05a22117



```bash
rover -lz /tf/caf/landingzones/caf_launchpad \
  -launchpad \
  -var-folder /tf/caf/gcc_starter/landingzone/configuration/level0/launchpad \
  -env sandpit \
  -skip-permission-check \
  -a plan
```

```bash
rover -lz /tf/caf/landingzones/caf_launchpad \
  -launchpad \
  -var-folder /tf/caf/gcc_starter/landingzone/configuration/level0/launchpad \
  -parallelism 30 \
  -env sandpit \
  -skip-permission-check \
  -a apply
```  

```bash
rover -lz /tf/caf/landingzones/caf_launchpad \
  -launchpad \
  -var-folder /tf/caf/gcc_starter/landingzone/configuration/level0/launchpad \
  -parallelism 30 \
  -env sandpit \
  -skip-permission-check \
  -a destroy
``` 