terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "rg-cicd"
  location = "East US"
}

resource "azurerm_container_group" "container_group" {
  name                = "webapp-nodejs"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  ip_address_type     = "Public"
  dns_name_label      = "webapp-nodejs"
  os_type             = "Linux"
  restart_policy      = "OnFailure"
  exposed_port = [{
    port     = 3000
    protocol = "TCP"
  }]

  container {
    name     = "container-webapp-nodejs"
    image    = "thdesous/cicd-webapp-nodejs:latest"
    cpu      = "0.5"
    memory   = "1.5"
    commands = ["npm", "start"]
    ports {
      port     = 3000
      protocol = "TCP"
    }
  }
  tags = {
    "item-type"      = "container-instance",
    "resource-group" = "rg-cicd"
  }
}

output "azurerm_container_group" {
  value     = "azurerm_container_group.azurerm_container_group"
  sensitive = true
}