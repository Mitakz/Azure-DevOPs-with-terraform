terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}




resource "azurerm_resource_group" "terra_test" {
  name = "tf-rg"
  location = "West Europe"
}


resource "azurerm_container_group" "tfcg_test" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.terra_test.location
  resource_group_name       = azurerm_resource_group.terra_test.name

  ip_address_type     = "Public"
  dns_name_label      = "mysampleweatherapi"
  os_type             = "Linux"

  container {
      name            = "weatherapi"
      image           = "mitakz/weatherapi"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}