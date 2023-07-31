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

resource "azurerm_resource_group" "ideaqu_cornerstone" {
  name     = var.resource_group_name
  location = var.location
}

resource "azapi_resource" "serverFarms" {
  type = "Microsoft.Web/serverfarms@2022-03-01"
  name = var.serverFarms_name
  depends_on = [ azurerm_resource_group.ideaqu_cornerstone ]

  location = var.location
  parent_id = azurerm_resource_group.ideaqu_cornerstone.id
  tags = var.tags
  body = jsonencode({
    properties = {
      elasticScaleEnabled = false
      hyperV = false
      isSpot = false
      isXenon = false
      maximumElasticWorkerCount = 1
      perSiteScaling = false
      reserved = true
      targetWorkerCount = 0
      targetWorkerSizeId = 0
      zoneRedundant = false
    }
    sku = {
      capacity = var.serverFarms_capacity
      locations = [
        "Australia Central"
      ]
      name = "P1v2"
      size = "P1v2"
      tier = "PremiumV2"
    }
    kind = "linux"
  })
}

module "cornerstone-container-app" {
    source  = "./modules/cornerstone-container-app"
    name    = var.cornerstone_fe_web_site_name
    depends_on = [ azapi_resource.serverFarms ]
    
    web_app_name    = var.cornerstone_fe_web_site_name
    serverFarmId    = jsondecode(azapi_resource.serverFarms).id
    resource_group_id   = azurerm_resource_group.ideaqu_cornerstone.id
    prod_siteConfig_cors    = {}
    prod_siteConfig_ipSecurityRestrictions = var.cornerstone_fe_prod_ipSecurityRestrictions
    dev_siteConfig_ipSecurityRestrictions = var.cornerstone_fe_dev_ipSecurityRestrictions
    uat_siteConfig_ipSecurityRestrictions = var.cornerstone_fe_uat_ipSecurityRestrictions
}

module "cornerstone-container-app" {
    source  = "./modules/cornerstone-container-app"
    name    = var.cornerstone_admin_web_site_name
    depends_on = [ azapi_resource.serverFarms ]
    
    web_app_name    = var.cornerstone_admin_web_site_name
    serverFarmId    = jsondecode(azapi_resource.serverFarms).id
    resource_group_id   = azurerm_resource_group.ideaqu_cornerstone.id
    prod_siteConfig_cors    = {}
    prod_siteConfig_ipSecurityRestrictions = var.cornerstone_admin_prod_ipSecurityRestrictions
    dev_siteConfig_ipSecurityRestrictions = var.cornerstone_admin_dev_ipSecurityRestrictions
    uat_siteConfig_ipSecurityRestrictions = var.cornerstone_admin_uat_ipSecurityRestrictions
}
