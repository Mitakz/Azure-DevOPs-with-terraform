terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }




}

provider "azurerm" {
  features {}
}
terraform {
  backend "azurerm" {
    resource_group_name  = "mystorage-rg"
    storage_account_name = "tfdemoaccount"
    container_name       = "terrastate"
    key                  = "terraform.tfstate"
  }
}





resource "azurerm_resource_group" "terra_test" {
  name     = "tf-rg"
  location = "West Europe"
}


resource "azurerm_container_group" "tfcg_test" {
  name                = "weatherapi"
  location            = azurerm_resource_group.terra_test.location
  resource_group_name = azurerm_resource_group.terra_test.name

  ip_address_type = "Public"
  dns_name_label  = "mysampleweatherapi"
  os_type         = "Linux"

  container {
    name   = "weatherapi"
    image  = "mitakz/weatherapi:latest"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}