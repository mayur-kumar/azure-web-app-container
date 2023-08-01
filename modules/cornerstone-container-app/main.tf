terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }

    azapi = {
      source  = "Azure/azapi"
      version = "=1.8.0"
    }
  }
}

provider "azurerm" {
  features {
    skip_provider_registration = true
  }
}

resource "azapi_resource" "web_site" {
  type      = "Microsoft.Web/sites@2022-03-01"
  name      = var.web_app_name
  location  = var.location
  parent_id = var.resource_group_id
  tags      = var.tags
  body = jsonencode({
    properties = {
      clientAffinityEnabled      = false
      clientCertEnabled          = false
      clientCertMode             = "Required"
      containerSize              = var.prod_properties_containerSize
      customDomainVerificationId = var.customDomainVerificationId
      dailyMemoryTimeQuota       = 0
      enabled                    = var.enabled
      hostNamesDisabled          = var.prod_hostNamesDisabled
      hostNameSslStates          = var.prod_hostNameSslStates
      httpsOnly                  = true
      hyperV                     = false
      isXenon                    = false
      keyVaultReferenceIdentity  = var.prod_keyVaultReferenceIdentity
      publicNetworkAccess        = var.prod_publicNetworkAccess
      redundancyMode             = var.prod_redundancyMode
      reserved                   = true
      scmSiteAlsoStopped         = false
      serverFarmId               = var.serverFarmId
      siteConfig = {
        numberOfWorkers             = var.prod_siteConfig_numberOfWorkers,
        linuxFxVersion              = var.prod_siteConfig_linuxFxVersion,
        acrUseManagedIdentityCreds  = var.prod_siteConfig_acrUseManagedIdentityCreds,
        alwaysOn                    = var.prod_siteConfig_alwaysOn,
        http20Enabled               = var.prod_siteConfig_http20Enabled,
        functionAppScaleLimit       = var.prod_siteConfig_functionAppScaleLimit,
        minimumElasticInstanceCount = var.prod_siteConfig_minimumElasticInstanceCount
        acrUseManagedIdentityCreds  = false
        autoHealEnabled             = false
        azureStorageAccounts        = {}
        cors                        = var.prod_siteConfig_cors
        defaultDocuments = [
          "Default.htm",
          "Default.html",
          "Default.asp",
          "index.htm",
          "index.html",
          "iisstart.htm",
          "default.aspx",
          "index.php",
          "hostingstart.html"
        ]
        detailedErrorLoggingEnabled = false
        experiments = {
          rampUpRules = []
        }

        ftpsState                              = "FtpsOnly"
        functionsRuntimeScaleMonitoringEnabled = false
        httpLoggingEnabled                     = false
        ipSecurityRestrictions                 = var.prod_siteConfig_ipSecurityRestrictions
        loadBalancing                          = "LeastRequests"
        localMySqlEnabled                      = false
        logsDirectorySizeLimit                 = 35
        managedPipelineMode                    = "Integrated"
        minTlsVersion                          = "1.2"
        netFrameworkVersion                    = "v4.0"
        preWarmedInstanceCount                 = 0
        publicNetworkAccess                    = "Enabled"
        publishingUsername                     = "$cornerstone-fe"

        remoteDebuggingEnabled = false
        remoteDebuggingVersion = "VS2019"
        requestTracingEnabled  = false

        scmIpSecurityRestrictions = [
          {
            ipAddress   = "Any",
            action      = "Allow",
            priority    = 2147483647,
            name        = "Allow all",
            description = "Allow all access"
          }
        ]
        scmIpSecurityRestrictionsUseMain = false
        scmMinTlsVersion                 = "1.2"
        scmType                          = "VSTSRM"

        use32BitWorkerProcess = true
        virtualApplications = [
          {
            physicalPath   = "site\\wwwroot"
            preloadEnabled = true
            virtualPath    = "/"
          }
        ]
        vnetPrivatePortsCount = 0
        vnetRouteAllEnabled   = false
        websiteTimeZone       = "string"
        webSocketsEnabled     = false
      }

      storageAccountRequired  = false
      vnetContentShareEnabled = false
      vnetImagePullEnabled    = false
      vnetRouteAllEnabled     = false
    }
  })
}

resource "azapi_resource" "dev_web_site" {
  type       = "Microsoft.Web/sites/slots@2022-03-01"
  depends_on = [azapi_resource.web_site]
  name       = format("%s/dev", var.web_app_name)
  location   = var.location
  parent_id  = azapi_resource.web_site.id
  # parent_id = var.resource_group_id
  tags = var.tags
  body = jsonencode({
    properties = {
      clientAffinityEnabled      = false
      clientCertEnabled          = false
      clientCertMode             = "Required"
      containerSize              = var.dev_properties_containerSize
      customDomainVerificationId = var.customDomainVerificationId
      dailyMemoryTimeQuota       = 0
      enabled                    = var.enabled
      hostNamesDisabled          = var.dev_hostNamesDisabled
      hostNameSslStates          = var.dev_hostNameSslStates
      httpsOnly                  = true
      hyperV                     = false
      isXenon                    = false
      keyVaultReferenceIdentity  = var.dev_keyVaultReferenceIdentity
      publicNetworkAccess        = var.dev_publicNetworkAccess
      redundancyMode             = var.dev_redundancyMode
      reserved                   = true
      scmSiteAlsoStopped         = false
      serverFarmId               = var.serverFarmId
      siteConfig = {
        numberOfWorkers             = var.dev_siteConfig_numberOfWorkers,
        linuxFxVersion              = var.dev_siteConfig_linuxFxVersion,
        acrUseManagedIdentityCreds  = var.dev_siteConfig_acrUseManagedIdentityCreds,
        alwaysOn                    = var.dev_siteConfig_alwaysOn,
        http20Enabled               = var.dev_siteConfig_http20Enabled,
        functionAppScaleLimit       = var.dev_siteConfig_functionAppScaleLimit,
        minimumElasticInstanceCount = var.dev_siteConfig_minimumElasticInstanceCount
        acrUseManagedIdentityCreds  = false
        autoHealEnabled             = false
        azureStorageAccounts        = {}
        cors                        = var.dev_siteConfig_cors
        defaultDocuments = [
          "Default.htm",
          "Default.html",
          "Default.asp",
          "index.htm",
          "index.html",
          "iisstart.htm",
          "default.aspx",
          "index.php",
          "hostingstart.html"
        ]
        detailedErrorLoggingEnabled = false
        experiments = {
          rampUpRules = []
        }

        ftpsState                              = "FtpsOnly"
        functionsRuntimeScaleMonitoringEnabled = false
        httpLoggingEnabled                     = false
        ipSecurityRestrictions                 = var.dev_siteConfig_ipSecurityRestrictions
        loadBalancing                          = "LeastRequests"
        localMySqlEnabled                      = false
        logsDirectorySizeLimit                 = 35
        managedPipelineMode                    = "Integrated"
        minTlsVersion                          = "1.2"
        netFrameworkVersion                    = "v4.0"
        preWarmedInstanceCount                 = 0
        publicNetworkAccess                    = "Enabled"
        publishingUsername                     = "$cornerstone-fe"

        remoteDebuggingEnabled = false
        remoteDebuggingVersion = "VS2019"
        requestTracingEnabled  = false

        scmIpSecurityRestrictions = [
          {
            ipAddress   = "Any",
            action      = "Allow",
            priority    = 2147483647,
            name        = "Allow all",
            description = "Allow all access"
          }
        ]
        scmIpSecurityRestrictionsUseMain = false
        scmMinTlsVersion                 = "1.2"
        scmType                          = "VSTSRM"

        use32BitWorkerProcess = true
        virtualApplications = [
          {
            physicalPath   = "site\\wwwroot"
            preloadEnabled = true
            virtualPath    = "/"
          }
        ]
        vnetPrivatePortsCount = 0
        vnetRouteAllEnabled   = false
        websiteTimeZone       = "string"
        webSocketsEnabled     = false
      }

      storageAccountRequired  = false
      vnetContentShareEnabled = false
      vnetImagePullEnabled    = false
      vnetRouteAllEnabled     = false
    }
  })
}

resource "azapi_resource" "uat_web_site" {
  type       = "Microsoft.Web/sites/slots@2022-03-01"
  depends_on = [azapi_resource.web_site]
  name       = format("%s/uat", var.web_app_name)
  location   = var.location
  parent_id  = azapi_resource.web_site.id
  # parent_id = var.resource_group_id
  tags = var.tags
  body = jsonencode({
    properties = {
      clientAffinityEnabled      = false
      clientCertEnabled          = false
      clientCertMode             = "Required"
      containerSize              = var.uat_properties_containerSize
      customDomainVerificationId = var.customDomainVerificationId
      dailyMemoryTimeQuota       = 0
      enabled                    = var.enabled
      hostNamesDisabled          = var.uat_hostNamesDisabled
      hostNameSslStates          = var.uat_hostNameSslStates
      httpsOnly                  = true
      hyperV                     = false
      isXenon                    = false
      keyVaultReferenceIdentity  = var.uat_keyVaultReferenceIdentity
      publicNetworkAccess        = var.uat_publicNetworkAccess
      redundancyMode             = var.uat_redundancyMode
      reserved                   = true
      scmSiteAlsoStopped         = false
      serverFarmId               = var.serverFarmId
      siteConfig = {
        numberOfWorkers             = var.uat_siteConfig_numberOfWorkers,
        linuxFxVersion              = var.uat_siteConfig_linuxFxVersion,
        acrUseManagedIdentityCreds  = var.uat_siteConfig_acrUseManagedIdentityCreds,
        alwaysOn                    = var.uat_siteConfig_alwaysOn,
        http20Enabled               = var.uat_siteConfig_http20Enabled,
        functionAppScaleLimit       = var.uat_siteConfig_functionAppScaleLimit,
        minimumElasticInstanceCount = var.uat_siteConfig_minimumElasticInstanceCount
        acrUseManagedIdentityCreds  = false
        autoHealEnabled             = false
        azureStorageAccounts        = {}
        cors                        = var.uat_siteConfig_cors
        defaultDocuments = [
          "Default.htm",
          "Default.html",
          "Default.asp",
          "index.htm",
          "index.html",
          "iisstart.htm",
          "default.aspx",
          "index.php",
          "hostingstart.html"
        ]
        detailedErrorLoggingEnabled = false
        experiments = {
          rampUpRules = []
        }

        ftpsState                              = "FtpsOnly"
        functionsRuntimeScaleMonitoringEnabled = false
        httpLoggingEnabled                     = false
        ipSecurityRestrictions                 = var.uat_siteConfig_ipSecurityRestrictions
        loadBalancing                          = "LeastRequests"
        localMySqlEnabled                      = false
        logsDirectorySizeLimit                 = 35
        managedPipelineMode                    = "Integrated"
        minTlsVersion                          = "1.2"
        netFrameworkVersion                    = "v4.0"
        preWarmedInstanceCount                 = 0
        publicNetworkAccess                    = "Enabled"
        publishingUsername                     = "$cornerstone-fe"

        remoteDebuggingEnabled = false
        remoteDebuggingVersion = "VS2019"
        requestTracingEnabled  = false

        scmIpSecurityRestrictions = [
          {
            ipAddress   = "Any",
            action      = "Allow",
            priority    = 2147483647,
            name        = "Allow all",
            description = "Allow all access"
          }
        ]
        scmIpSecurityRestrictionsUseMain = false
        scmMinTlsVersion                 = "1.2"
        scmType                          = "VSTSRM"

        use32BitWorkerProcess = true
        virtualApplications = [
          {
            physicalPath   = "site\\wwwroot"
            preloadEnabled = true
            virtualPath    = "/"
          }
        ]
        vnetPrivatePortsCount = 0
        vnetRouteAllEnabled   = false
        websiteTimeZone       = "string"
        webSocketsEnabled     = false
      }

      storageAccountRequired  = false
      vnetContentShareEnabled = false
      vnetImagePullEnabled    = false
      vnetRouteAllEnabled     = false
    }
  })
}

resource "azapi_resource" "publishing_credentials_ftp" {
  type       = "Microsoft.Web/sites/basicPublishingCredentialsPolicies@2022-03-01"
  depends_on = [azapi_resource.web_site]
  name       = "ftp"
  parent_id  = azapi_resource.web_site.id
  body = jsonencode({
    properties = {
      allow = true
    }
  })
}

resource "azapi_resource" "publishing_credentials_scm" {
  type       = "Microsoft.Web/sites/basicPublishingCredentialsPolicies@2022-03-01"
  depends_on = [azapi_resource.web_site]
  name       = "scm"
  parent_id  = azapi_resource.web_site.id
  body = jsonencode({
    properties = {
      allow = true
    }
  })
}

# resource "azapi_resource" "prod_azure_hostnameBinding" {
#   type       = "Microsoft.Web/sites/hostNameBindings@2022-03-01"
#   name       = format("%s/%s.azurewebsites.net", var.web_app_name, var.web_app_name)
#   depends_on = [azapi_resource.web_site]
#   parent_id  = azapi_resource.web_site.id
#   body = jsonencode({
#     properties = {
#       siteName     = var.web_app_name,
#       hostNameType = "Verified"
#     }
#   })
# }

# resource "azapi_resource" "prod_hostnameBinding" {
#   type       = "Microsoft.Web/sites/hostNameBindings@2022-03-01"
#   name       = format("%s/rewards.ourmedical.com.au", var.web_app_name)
#   depends_on = [azapi_resource.web_site]
#   parent_id  = azapi_resource.web_site.id
#   body = jsonencode({
#     properties = {
#       siteName     = var.web_app_name,
#       hostNameType = "Verified"
#     }
#   })
# }
