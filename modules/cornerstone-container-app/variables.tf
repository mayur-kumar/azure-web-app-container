variable "web_app_name" {
  type = string
  description = "The name of the webapp"
}

variable "location" {
  type = string
  default = "Australia Central"
  description = "The location for the deployment"
}

variable "enabled" {
  type = bool
  default = true
  description = "Enable the Service"
}

variable "serverFarmId" {
  type = string
  description = "Server Farm ID"
}

variable "kind" {
  type = string
  default = "app,linux,container"
  description = "Kind of AppService"
}

variable "prod_properties_containerSize" {
  type = int
  default = 0
  description = "The container size for the prod deployment"
}

variable "prod_hostNamesDisabled" {
  type = bool
  default = false
  description = "Main site hostNamesDisabled"
}

variable "prod_keyVaultReferenceIdentity" {
  type = string
  default = "SystemAssigned"
  description = "KeyVault to use for appService"
}

variable "prod_publicNetworkAccess" {
  type = string
  default = "Enabled"
  description = "Public Network access"
}

variable "prod_redundancyMode" {
  type = string
  default = "None"
  description = "Prod redundancy mode"
}

variable "prod_hostNameSslStates" {
    type = list(object({
      name      = string
      sslState  = string
      hostType  = string 
    }))
    description = "hostNameSslStates"
}

variable "prod_siteConfig_linuxFxVersion" {
  type = string
  default = "DOCKER|mcr.microsoft.com/appsvc/staticsite:latest"
  description = "DOCKER|registry.repo.image:version"
}

variable "prod_siteConfig_numberOfWorkers" {
  type = int
  default = 1
  description = "Number of workers"
}

variable "prod_siteConfig_acrUseManagedIdentityCreds" {
  type = bool
  default = false
  description = "prod site config for acrManagedIdentityCreds"
}

variable "prod_siteConfig_alwaysOn" {
  type = bool
  default = true
  description = "Should it always be on?"
}

variable "prod_siteConfig_http20Enabled" {
  type = bool
  default = false
  description = "Enable http 2.0"
}

variable "prod_siteConfig_functionAppScaleLimit" {
  type = int
  default = 0
  description = "functionAppScaleLimit for the prod deployment"
}

variable "prod_siteConfig_minimumElasticInstanceCount" {
  type = int
  default = 0
  description = "minimumElasticInstanceCount for the prod deployment"
}

variable "prod_siteConfig_cors" {
  type = object({
    allowedOrigins = list(string)
    supportCredentials = bool
  })
  default = {}
  description = "Add Cors details"
}

variable "prod_siteConfig_ipSecurityRestrictions" {
  type = list(object({
    ipAddress = string
    action = string
    tag = string
    priority = int
    name = string
  }))
  default = [
    {
        ipAddress = "0.0.0.0/0",
        action = "Allow",
        tag = "Default",
        priority = 310,
        name = "AllowAll",
        description = "Allow All"
    },
    {
        ipAddress = "Any",
        action = "Deny",
        priority = 2147483647,
        name = "Deny all",
        description = "Deny all access"
    }
  ]
  description = "IP Restriction to add. Defaults to allow all addresses"
}

variable "dev_properties_containerSize" {
  type = int
  default = 0
  description = "The container size for the dev deployment"
}

variable "dev_hostNamesDisabled" {
  type = bool
  default = false
  description = "Main site hostNamesDisabled"
}

variable "dev_keyVaultReferenceIdentity" {
  type = string
  default = "SystemAssigned"
  description = "KeyVault to use for appService"
}

variable "dev_publicNetworkAccess" {
  type = string
  default = "Enabled"
  description = "Public Network access"
}

variable "dev_redundancyMode" {
  type = string
  default = "None"
  description = "dev redundancy mode"
}

variable "dev_hostNameSslStates" {
    type = list(object({
      name      = string
      sslState  = string
      hostType  = string 
    }))
    description = "hostNameSslStates"
}

variable "dev_siteConfig_linuxFxVersion" {
  type = string
  default = "DOCKER|mcr.microsoft.com/appsvc/staticsite:latest"
  description = "DOCKER|registry.repo.image:version"
}

variable "dev_siteConfig_numberOfWorkers" {
  type = int
  default = 1
  description = "Number of workers"
}

variable "dev_siteConfig_acrUseManagedIdentityCreds" {
  type = bool
  default = false
  description = "dev site config for acrManagedIdentityCreds"
}

variable "dev_siteConfig_alwaysOn" {
  type = bool
  default = true
  description = "Should it always be on?"
}

variable "dev_siteConfig_http20Enabled" {
  type = bool
  default = false
  description = "Enable http 2.0"
}

variable "dev_siteConfig_functionAppScaleLimit" {
  type = int
  default = 0
  description = "functionAppScaleLimit for the dev deployment"
}

variable "dev_siteConfig_minimumElasticInstanceCount" {
  type = int
  default = 0
  description = "minimumElasticInstanceCount for the dev deployment"
}

variable "dev_siteConfig_cors" {
  type = object({
    allowedOrigins = list(string)
    supportCredentials = bool
  })
  default = {}
  description = "Add Cors details"
}

variable "dev_siteConfig_ipSecurityRestrictions" {
  type = list(object({
    ipAddress = string
    action = string
    tag = string
    priority = int
    name = string
  }))
  default = [
    {
        ipAddress = "0.0.0.0/0",
        action = "Allow",
        tag = "Default",
        priority = 310,
        name = "AllowAll",
        description = "Allow All"
    },
    {
        ipAddress = "Any",
        action = "Deny",
        priority = 2147483647,
        name = "Deny all",
        description = "Deny all access"
    }
  ]
  description = "IP Restriction to add. Defaults to allow all addresses"
}

variable "uat_properties_containerSize" {
  type = int
  default = 0
  description = "The container size for the uat deployment"
}

variable "uat_hostNamesDisabled" {
  type = bool
  default = false
  description = "Main site hostNamesDisabled"
}

variable "uat_keyVaultReferenceIdentity" {
  type = string
  default = "SystemAssigned"
  description = "KeyVault to use for appService"
}

variable "uat_publicNetworkAccess" {
  type = string
  default = "Enabled"
  description = "Public Network access"
}

variable "uat_redundancyMode" {
  type = string
  default = "None"
  description = "uat redundancy mode"
}

variable "uat_hostNameSslStates" {
    type = list(object({
      name      = string
      sslState  = string
      hostType  = string 
    }))
    description = "hostNameSslStates"
}

variable "uat_siteConfig_linuxFxVersion" {
  type = string
  default = "DOCKER|mcr.microsoft.com/appsvc/staticsite:latest"
  description = "DOCKER|registry.repo.image:version"
}

variable "uat_siteConfig_numberOfWorkers" {
  type = int
  default = 1
  description = "Number of workers"
}

variable "uat_siteConfig_acrUseManagedIdentityCreds" {
  type = bool
  default = false
  description = "uat site config for acrManagedIdentityCreds"
}

variable "uat_siteConfig_alwaysOn" {
  type = bool
  default = true
  description = "Should it always be on?"
}

variable "uat_siteConfig_http20Enabled" {
  type = bool
  default = false
  description = "Enable http 2.0"
}

variable "uat_siteConfig_functionAppScaleLimit" {
  type = int
  default = 0
  description = "functionAppScaleLimit for the uat deployment"
}

variable "uat_siteConfig_minimumElasticInstanceCount" {
  type = int
  default = 0
  description = "minimumElasticInstanceCount for the uat deployment"
}

variable "uat_siteConfig_cors" {
  type = object({
    allowedOrigins = list(string)
    supportCredentials = bool
  })
  default = {}
  description = "Add Cors details"
}

variable "uat_siteConfig_ipSecurityRestrictions" {
  type = list(object({
    ipAddress = string
    action = string
    tag = string
    priority = int
    name = string
  }))
  default = [
    {
        ipAddress = "0.0.0.0/0",
        action = "Allow",
        tag = "Default",
        priority = 310,
        name = "AllowAll",
        description = "Allow All"
    },
    {
        ipAddress = "Any",
        action = "Deny",
        priority = 2147483647,
        name = "Deny all",
        description = "Deny all access"
    }
  ]
  description = "IP Restriction to add. Defaults to allow all addresses"
}

variable "customDomainVerificationId" {
  type = string
  description = "Domain verification ID to use"
}

variable "dailyMemoryTimeQuota" {
  type = int
  default = 0
  description = "The dailyMemoryTimeQuota"
}

variable "configuration_external" {
  type = bool
  default = true
  description = "Allow external access for the app service"
}

variable "resource_group_id" {
  type = string
  description = "Resource Group ID"
}

variable "container_image" {
  type = string
  description = "Conatiner image to use"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the web app."
}
