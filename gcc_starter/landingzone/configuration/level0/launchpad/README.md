## Pre-requisites

login account must be the owner of the subscription when creating the launchpad
purge all deleted key vaults before apply the launchpad

## Deployment


# login to sandpit tenant
rover login  --tenant {your subscription id}

# set to subscription (optional)
az account set --subscription {your subscription id}

# change the prefix 
Update "prefix" in global_settings.tfvars to your company name (max 4 characters) 

prefix = "xxxx"



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
