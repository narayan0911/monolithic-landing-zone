terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.64.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "stg-rg"
    storage_account_name = "narayanstg"
    container_name       = "tfstate"
    key                  = "monolithic.tfstate"
  }
}

provider "azurerm" {
  features {}
   skip_provider_registration = true
}