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
  subscription_id = "901615cc-4389-4472-98da-1d1c0e856cba"
  features {
    key_vault {
      purge_soft_deleted_keys_on_destroy = true
      recover_soft_deleted_keys          = true
    }
  }
}

provider "azapi" {
  subscription_id = "901615cc-4389-4472-98da-1d1c0e856cba"
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "ideaqu_cornerstone" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "kv" {
  name                       = "ideaqu-registry-keyvault"
  location                   = azurerm_resource_group.ideaqu_cornerstone.location
  resource_group_name        = azurerm_resource_group.ideaqu_cornerstone.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Delete",
      "Get",
      "Purge",
      "Recover",
      "Update",
      "GetRotationPolicy",
      "SetRotationPolicy"
    ]

    secret_permissions = [
      "Set",
    ]
  }
}

resource "azurerm_key_vault_key" "registry-kv" {
  name         = "ideaqu-registry-key"
  key_vault_id = azurerm_key_vault.kv.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  rotation_policy {
    automatic {
      time_before_expiry = "P30D"
    }

    expire_after         = "P90D"
    notify_before_expiry = "P29D"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "ideaqu-registry"
  resource_group_name = azurerm_resource_group.ideaqu_cornerstone.id
  location            = azurerm_resource_group.ideaqu_cornerstone.location
  sku                 = "Basic"

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.registry-uai.id
    ]
  }

  encryption {
    enabled            = true
    key_vault_key_id   = azurerm_key_vault_key.registry-kv.id
    identity_client_id = azurerm_user_assigned_identity.registry-uai.client_id
  }
}

resource "azurerm_user_assigned_identity" "registry-uai" {
  resource_group_name = azurerm_resource_group.ideaqu_cornerstone.name
  location            = azurerm_resource_group.ideaqu_cornerstone.location

  name = "ideaqu-registry-uai"
}

resource "azapi_resource" "serverFarms" {
  type       = "Microsoft.Web/serverfarms@2022-03-01"
  name       = var.serverFarms_name
  depends_on = [azurerm_resource_group.ideaqu_cornerstone]

  location  = var.location
  parent_id = azurerm_resource_group.ideaqu_cornerstone.id
  tags      = var.cornerstone_fe_tags
  body = jsonencode({
    properties = {
      elasticScaleEnabled       = false
      hyperV                    = false
      isSpot                    = false
      isXenon                   = false
      maximumElasticWorkerCount = 1
      perSiteScaling            = false
      reserved                  = true
      targetWorkerCount         = 0
      targetWorkerSizeId        = 0
      zoneRedundant             = false
    }
    sku = {
      capacity = var.serverFarms_capacity
      name     = "P1v2"
      size     = "P1v2"
      tier     = "PremiumV2"
    }
    kind = "linux"
  })
}

module "cornerstone_fe" {
  source = "./modules/cornerstone-container-app"

  web_app_name                           = var.cornerstone_fe_web_site_name
  serverFarmId                           = azapi_resource.serverFarms.id
  container_image                        = var.cornerstone_fe_container_image
  tags                                   = var.cornerstone_fe_tags
  customDomainVerificationId             = var.cornerstone_fe_customDomainVerificationId
  prod_hostNameSslStates                 = var.cornerstone_fe_prod_hostNameSslStates
  dev_hostNameSslStates                  = var.cornerstone_fe_dev_hostNameSslStates
  uat_hostNameSslStates                  = var.cornerstone_fe_uat_hostNameSslStates
  resource_group_id                      = azurerm_resource_group.ideaqu_cornerstone.id
  prod_siteConfig_cors                   = {}
  prod_siteConfig_ipSecurityRestrictions = var.cornerstone_fe_prod_ipSecurityRestrictions
  dev_siteConfig_ipSecurityRestrictions  = var.cornerstone_fe_dev_ipSecurityRestrictions
  uat_siteConfig_ipSecurityRestrictions  = var.cornerstone_fe_uat_ipSecurityRestrictions
}

module "cornerstone_admin" {
  source = "./modules/cornerstone-container-app"

  web_app_name                           = var.cornerstone_admin_web_site_name
  serverFarmId                           = azapi_resource.serverFarms.id
  container_image                        = var.cornerstone_admin_container_image
  tags                                   = var.cornerstone_admin_tags
  customDomainVerificationId             = var.cornerstone_admin_customDomainVerificationId
  prod_hostNameSslStates                 = var.cornerstone_admin_prod_hostNameSslStates
  dev_hostNameSslStates                  = var.cornerstone_admin_dev_hostNameSslStates
  uat_hostNameSslStates                  = var.cornerstone_admin_uat_hostNameSslStates
  resource_group_id                      = azurerm_resource_group.ideaqu_cornerstone.id
  prod_siteConfig_cors                   = {}
  prod_siteConfig_ipSecurityRestrictions = var.cornerstone_admin_prod_ipSecurityRestrictions
  dev_siteConfig_ipSecurityRestrictions  = var.cornerstone_admin_dev_ipSecurityRestrictions
  uat_siteConfig_ipSecurityRestrictions  = var.cornerstone_admin_uat_ipSecurityRestrictions
}
