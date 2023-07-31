location    =  "Australia Central"
resource_group_name = "ideaqu_cornerstone"
cornerstone_fe_web_site_name = "ideaqu_cornerstone_fe"
cornerstone_admin_web_site_name = "ideaqu_cornerstone_admin"

cornerstone_fe_prod_ipSecurityRestrictions = [
    {
        ipAddress = "212.241.242.26/32",
        action = "Allow",
        tag = "Default",
        priority = 1000,
        name = "Allow"
        description = "Allow only 212.241.242.26"
    },
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
        tag = "Custom",
        priority = 2147483647,
        name = "Deny all",
        description = "Deny all access"
    }
]

cornerstone_fe_dev_ipSecurityRestrictions = [
    {
        ipAddress = "212.241.242.26/32",
        action = "Allow",
        tag = "Default",
        priority = 1000,
        name = "Allow"
        description = "Allow only 212.241.242.26"
    },
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
        tag = "Custom",
        priority = 2147483647,
        name = "Deny all",
        description = "Deny all access"
    }
]

cornerstone_fe_uat_ipSecurityRestrictions = [
    {
        ipAddress = "212.241.242.26/32",
        action = "Allow",
        tag = "Default",
        priority = 1000,
        name = "Allow"
        description = "Allow only 212.241.242.26"
    },
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
        tag = "Custom",
        priority = 2147483647,
        name = "Deny all",
        description = "Deny all access"
    }
]

cornerstone_admin_prod_ipSecurityRestrictions = [
    {
        ipAddress = "212.241.242.26/32",
        action = "Allow",
        tag = "Default",
        priority = 1000,
        name = "Allow"
        description = "Allow only 212.241.242.26"
    },
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
        tag = "Custom",
        priority = 2147483647,
        name = "Deny all",
        description = "Deny all access"
    }
]

cornerstone_admin_dev_ipSecurityRestrictions = [
    {
        ipAddress = "212.241.242.26/32",
        action = "Allow",
        tag = "Default",
        priority = 1000,
        name = "Allow"
        description = "Allow only 212.241.242.26"
    },
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
        tag = "Custom",
        priority = 2147483647,
        name = "Deny all",
        description = "Deny all access"
    }
]

cornerstone_admin_uat_ipSecurityRestrictions = [
    {
        ipAddress = "212.241.242.26/32",
        action = "Allow",
        tag = "Default",
        priority = 1000,
        name = "Allow"
        description = "Allow only 212.241.242.26"
    },
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
        tag = "Custom",
        priority = 2147483647,
        name = "Deny all",
        description = "Deny all access"
    }
]