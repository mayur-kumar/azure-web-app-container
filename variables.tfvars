location                                     = "Australia Central"
resource_group_name                          = "ideaqu_cornerstone"
cornerstone_fe_web_site_name                 = "ideaqu-cornerstone-fe"
cornerstone_admin_web_site_name              = "ideaqu-cornerstone-admin"
cornerstone_fe_container_image               = "mcr.microsoft.com/appsvc/staticsite:latest"
cornerstone_admin_container_image            = "mcr.microsoft.com/appsvc/staticsite:latest"
cornerstone_fe_customDomainVerificationId    = "0750C4DF797C1A7022A41457C7735044F8980CE5D4E7CB57788803E570289DD2"
cornerstone_admin_customDomainVerificationId = "0750C4DF797C1A7022A41457C7735044F8980CE5D4E7CB57788803E570289DD2"

cornerstone_fe_uat_hostNameSslStates = [
  {
    name     = "ideaqu-cornerstone-fe-uat.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Standard"
  },
  {
    name       = "uat-membership.ourmedical.com.au",
    sslState   = "SniEnabled",
    thumbprint = "1A0CAF8CBE0B9EDB02FBBF8FC2C5A9B8B7DD22B9",
    hostType   = "Standard"
  },
  {
    name     = "ideaqu-cornerstone-fe-uat.scm.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Repository"
  }
]

cornerstone_fe_prod_hostNameSslStates = [
  {
    name     = "ideaqu-cornerstone-fe.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Standard"
  },
  {
    name       = "rewards.ourmedical.com.au",
    sslState   = "SniEnabled",
    thumbprint = "3727DF2732CC3EA3560CB6660979A41CC61DE6E2",
    hostType   = "Standard"
  },
  {
    name     = "ideaqu-cornerstone-fe.scm.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Repository"
  }
]

cornerstone_fe_dev_hostNameSslStates = [
  {
    name     = "ideaqu-cornerstone-fe-dev.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Standard"
  },
  {
    name       = "dev-membership.ourmedical.com.au",
    sslState   = "SniEnabled",
    thumbprint = "0B38EC986604B5E3E04A437AB88A8B584FC9503C",
    hostType   = "Standard"
  },
  {
    name     = "ideaqu-cornerstone-fe-dev.scm.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Repository"
  }
]

# Cornerstone admin hostnameSSlStates

cornerstone_admin_uat_hostNameSslStates = [
  {
    name     = "ideaqu-cornerstone-admin-uat.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Standard"
  },
  {
    name       = "uat-admin.ourmedical.com.au",
    sslState   = "SniEnabled",
    thumbprint = "6A0155CE9B0138C7C890EC88D4FD6B14257A4F4F",
    hostType   = "Standard"
  },
  {
    name     = "ideaqu-cornerstone-admin-uat.scm.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Repository"
  }
]

cornerstone_admin_prod_hostNameSslStates = [
  {
    name     = "ideaqu-cornerstone-admin.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Standard"
  },
  {
    name       = "admin.ourmedical.com.au",
    sslState   = "SniEnabled",
    thumbprint = "2F615820F74F85931F86F45F6541BB90E8AF3BA7",
    hostType   = "Standard"
  },
  {
    name     = "ideaqu-cornerstone-admin.scm.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Repository"
  }
]

cornerstone_admin_dev_hostNameSslStates = [
  {
    name     = "ideaqu-cornerstone-admin-dev.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Standard"
  },
  {
    name       = "dev-admin.ourmedical.com.au",
    sslState   = "SniEnabled",
    thumbprint = "C165B9CD37053F7419990BFBB9010F5509D042BD",
    hostType   = "Standard"
  },
  {
    name     = "ideaqu-cornerstone-admin-dev.scm.azurewebsites.net",
    sslState = "Disabled",
    hostType = "Repository"
  }
]

# End of cornerstone admin hostnameSslStates

cornerstone_fe_prod_ipSecurityRestrictions = [
  {
    ipAddress   = "212.241.242.26/32",
    action      = "Allow",
    tag         = "Default",
    priority    = 1000,
    name        = "Allow"
    description = "Allow only 212.241.242.26"
  },
  {
    ipAddress   = "0.0.0.0/0",
    action      = "Allow",
    tag         = "Default",
    priority    = 310,
    name        = "AllowAll",
    description = "Allow All"
  },
  {
    ipAddress   = "Any",
    action      = "Deny",
    tag         = "Custom",
    priority    = 2147483647,
    name        = "Deny all",
    description = "Deny all access"
  }
]

cornerstone_fe_dev_ipSecurityRestrictions = [
  {
    ipAddress   = "212.241.242.26/32",
    action      = "Allow",
    tag         = "Default",
    priority    = 1000,
    name        = "Allow"
    description = "Allow only 212.241.242.26"
  },
  {
    ipAddress   = "0.0.0.0/0",
    action      = "Allow",
    tag         = "Default",
    priority    = 310,
    name        = "AllowAll",
    description = "Allow All"
  },
  {
    ipAddress   = "Any",
    action      = "Deny",
    tag         = "Custom",
    priority    = 2147483647,
    name        = "Deny all",
    description = "Deny all access"
  }
]

cornerstone_fe_uat_ipSecurityRestrictions = [
  {
    ipAddress   = "212.241.242.26/32",
    action      = "Allow",
    tag         = "Default",
    priority    = 1000,
    name        = "Allow"
    description = "Allow only 212.241.242.26"
  },
  {
    ipAddress   = "0.0.0.0/0",
    action      = "Allow",
    tag         = "Default",
    priority    = 310,
    name        = "AllowAll",
    description = "Allow All"
  },
  {
    ipAddress   = "Any",
    action      = "Deny",
    tag         = "Custom",
    priority    = 2147483647,
    name        = "Deny all",
    description = "Deny all access"
  }
]

cornerstone_admin_prod_ipSecurityRestrictions = [
  {
    ipAddress   = "212.241.242.26/32",
    action      = "Allow",
    tag         = "Default",
    priority    = 1000,
    name        = "Allow"
    description = "Allow only 212.241.242.26"
  },
  {
    ipAddress   = "0.0.0.0/0",
    action      = "Allow",
    tag         = "Default",
    priority    = 310,
    name        = "AllowAll",
    description = "Allow All"
  },
  {
    ipAddress   = "Any",
    action      = "Deny",
    tag         = "Custom",
    priority    = 2147483647,
    name        = "Deny all",
    description = "Deny all access"
  }
]

cornerstone_admin_dev_ipSecurityRestrictions = [
  {
    ipAddress   = "212.241.242.26/32",
    action      = "Allow",
    tag         = "Default",
    priority    = 1000,
    name        = "Allow"
    description = "Allow only 212.241.242.26"
  },
  {
    ipAddress   = "0.0.0.0/0",
    action      = "Allow",
    tag         = "Default",
    priority    = 310,
    name        = "AllowAll",
    description = "Allow All"
  },
  {
    ipAddress   = "Any",
    action      = "Deny",
    tag         = "Custom",
    priority    = 2147483647,
    name        = "Deny all",
    description = "Deny all access"
  }
]

cornerstone_admin_uat_ipSecurityRestrictions = [
  {
    ipAddress   = "212.241.242.26/32",
    action      = "Allow",
    tag         = "Default",
    priority    = 1000,
    name        = "Allow"
    description = "Allow only 212.241.242.26"
  },
  {
    ipAddress   = "0.0.0.0/0",
    action      = "Allow",
    tag         = "Default",
    priority    = 310,
    name        = "AllowAll",
    description = "Allow All"
  },
  {
    ipAddress   = "Any",
    action      = "Deny",
    tag         = "Custom",
    priority    = 2147483647,
    name        = "Deny all",
    description = "Deny all access"
  }
]
