#
# Note: diagnostic_log_analytics is pre-created by GCC during onboarding
# use log_analytics_resource_id instead of log_analytics_key
#

diagnostics_destinations = {
  # Storage keys must reference the azure region name
  log_analytics = {   # <- this is destination type
    central_logs = {  # <- this is destination key
      log_analytics_resource_id = "/subscriptions/e22a351f-db36-4a02-9793-0f2189d5f3ab/resourceGroups/gcci-rg-agency-law/providers/Microsoft.OperationalInsights/workspaces/gcci-law-central-logs",
      log_analytics_destination_type = "Dedicated"
    }
  }

}
