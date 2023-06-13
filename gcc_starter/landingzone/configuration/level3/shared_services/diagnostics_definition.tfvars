
diagnostics_definition = {
  keyvault = { # <- this is the definition_key
    name = "keyvault_logs_and_metrics"
    categories = {
      log = [
        # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AuditEvent", true, false, 14],
        ["AzurePolicyEvaluationDetails", true, false, 14],
      ]
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }
  }
  
  application_gateway = {
    name = "application_gateway_logs_and_metrics"
    categories = {
      log = [
        # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["ApplicationGatewayAccessLog", true, false, 14],
        ["ApplicationGatewayPerformanceLog", true, false, 14],   
        ["ApplicationGatewayFirewallLog", true, false, 14],                
      ]
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }
  } 

  apim = {
    name = "apim_logs_and_metrics"
    categories = {
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }
  }    

  redis_cache = {
    name = "redis_cache_logs_and_metrics"

    categories = {
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }
  }

  azurerm_firewall = {
    name = "azurerm_firewall_logs_and_metrics"
    categories = {
      log = [
        # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AzureFirewallApplicationRule", true, false, 7],
        ["AzureFirewallNetworkRule", true, false, 7],
        ["AzureFirewallDnsProxy", true, false, 7],
      ]
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }

  }

  public_ip_address = {
    name = "public_ip_address_logs_and_metrics"
    categories = {
      log = [
        # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["DDoSProtectionNotifications", true, false, 7],
        ["DDoSMitigationFlowLogs", true, false, 7],
        ["DDoSMitigationReports", true, false, 7],
      ]
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }

  }

  bastion_host = {
    name = "bastion_host_logs_and_metrics"
    categories = {
      log = [
        # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["BastionAuditLogs", true, false, 7],
      ]
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }

  }

  default_all = {
    name = "operational_logs_and_metrics"
    categories = {
      log = [
        # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AuditEvent", true, false, 7],
      ]
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }

  }

  azure_container_registry = {
    name = "acr_logs_and_metrics"
    categories = {
      log = [
        # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["ContainerRegistryRepositoryEvents", true, false, 7],
        ["ContainerRegistryLoginEvents", true, false, 7],
      ]
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }
  }
  azure_kubernetes_cluster = {
    name = "aks_logs_and_metrics"
    categories = {
      log = [
        # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["kube-apiserver", true, false, 7],
        ["kube-audit", false, false, 0],
        ["kube-audit-admin", true, false, 7],
        ["kube-controller-manager", true, false, 7],
        ["kube-scheduler", false, false, 0],
        ["cluster-autoscaler", true, false, 7],
        ["guard", true, false, 7],
      ]
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AllMetrics", true, false, 7],
      ]
    }
  }

  mssql_db = {
    name = "operational_logs_and_metrics"

    categories = {
      log = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["AutomaticTuning", true, false, 7],
        ["Blocks", true, false, 7],
        ["DatabaseWaitStatistics", true, false, 7],
        ["Deadlocks", true, false, 7],
        ["DevOpsOperationsAudit", true, false, 7],
        ["QueryStoreRuntimeStatistics", true, false, 7],
        ["QueryStoreWaitStatistics", true, false, 7],
        ["SQLInsights", true, false, 7],
        ["SQLSecurityAuditEvents", true, false, 7],
        ["Timeouts", true, false, 7],
        ["Errors", true, false, 7],

      ]
      metric = [
        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]
        ["Basic", true, false, 7],
        ["InstanceAndAppAdvanced", true, false, 7],
        ["WorkloadManagement", true, false, 7],
      ]
    }
  }
    
}