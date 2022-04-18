terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.0.0"

  backend "azurerm" {
    resource_group_name  = "rg-cicd"
    storage_account_name = "storageaccountwebnodejs"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_container_group" "container_group" {
  name                = "webapp-nodejs"
  location            = "brazilsouth"
  resource_group_name = "rg-cicd"
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
    memory   = "1.0"
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