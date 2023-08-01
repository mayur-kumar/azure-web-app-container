variable "serverFarms_name" {
  type    = string
  default = "ideaqu_cornerstone"
}

variable "serverFarms_capacity" {
  type    = number
  default = 1
}

variable "cornerstone_fe_tags" {
  type = map(string)
  default = {
    company = "ideaqu"
    app     = "cornerstone_fe"
  }
  description = "A mapping of tags to assign to the web app."
}

variable "cornerstone_admin_tags" {
  type = map(string)
  default = {
    company = "ideaqu"
    app     = "cornerstone_admin"
  }
  description = "A mapping of tags to assign to the web app."
}

variable "location" {
  type    = string
  default = "Australia Central"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group ID"
}

variable "cornerstone_fe_web_site_name" {
  type        = string
  description = "website name for cornerstone FE"
}

variable "cornerstone_admin_web_site_name" {
  type        = string
  description = "website name for cornerstone Admin"
}

variable "cornerstone_fe_customDomainVerificationId" {
  type        = string
  description = "Custom domain verification"
}

variable "cornerstone_fe_container_image" {
  type        = string
  description = "container image to use"
}

# hostNameSslStates for FE

variable "cornerstone_fe_prod_hostNameSslStates" {
  type = list(object({
    name       = string
    sslState   = string
    hostType   = string
    thumbprint = optional(string, null)
  }))
  description = "hostNameSslStates"
}

variable "cornerstone_fe_dev_hostNameSslStates" {
  type = list(object({
    name       = string
    sslState   = string
    hostType   = string
    thumbprint = optional(string, null)
  }))
  description = "hostNameSslStates"
}

variable "cornerstone_fe_uat_hostNameSslStates" {
  type = list(object({
    name       = string
    sslState   = string
    hostType   = string
    thumbprint = optional(string, null)
  }))
  description = "hostNameSslStates"
}

variable "cornerstone_fe_prod_ipSecurityRestrictions" {
  type = list(object({
    ipAddress   = string
    action      = string
    tag         = optional(string, null)
    priority    = number
    description = optional(string, null)
    name        = string
  }))
  description = "The ipRestriction for FE prod"
}

variable "cornerstone_fe_dev_ipSecurityRestrictions" {
  type = list(object({
    ipAddress   = string
    action      = string
    tag         = optional(string, null)
    priority    = number
    description = optional(string, null)
    name        = string
  }))
  description = "The ipRestriction for FE dev"
}

variable "cornerstone_fe_uat_ipSecurityRestrictions" {
  type = list(object({
    ipAddress   = string
    action      = string
    tag         = optional(string, null)
    priority    = number
    description = optional(string, null)
    name        = string
  }))
  description = "The ipRestriction for FE uat"
}

variable "cornerstone_admin_container_image" {
  type        = string
  description = "Image Name"
}

variable "cornerstone_admin_prod_ipSecurityRestrictions" {
  type = list(object({
    ipAddress   = string
    action      = string
    tag         = optional(string, null)
    priority    = number
    description = optional(string, null)
    name        = string
  }))
  description = "The ipRestriction for Admin prod"
}

variable "cornerstone_admin_dev_ipSecurityRestrictions" {
  type = list(object({
    ipAddress   = string
    action      = string
    tag         = optional(string, null)
    priority    = number
    description = optional(string, null)
    name        = string
  }))
  description = "The ipRestriction for Admin dev"
}

variable "cornerstone_admin_uat_ipSecurityRestrictions" {
  type = list(object({
    ipAddress   = string
    action      = string
    tag         = optional(string, null)
    priority    = number
    description = optional(string, null)
    name        = string
  }))
  description = "The ipRestriction for Admin uat"
}

variable "cornerstone_admin_customDomainVerificationId" {
  type        = string
  description = "The custom domain verification ID to use"
}

variable "cornerstone_admin_prod_hostNameSslStates" {
  type = list(object({
    name       = string
    sslState   = string
    hostType   = string
    thumbprint = optional(string, null)
  }))
  description = "hostNameSslStates"
}

variable "cornerstone_admin_dev_hostNameSslStates" {
  type = list(object({
    name       = string
    sslState   = string
    hostType   = string
    thumbprint = optional(string, null)
  }))
  description = "hostNameSslStates"
}

variable "cornerstone_admin_uat_hostNameSslStates" {
  type = list(object({
    name       = string
    sslState   = string
    hostType   = string
    thumbprint = optional(string, null)
  }))
  description = "hostNameSslStates"
}