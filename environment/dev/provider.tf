terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "stg-rg"
    storage_account_name = "mishrastorage"
    container_name       = "tfstate"
    key                  = "monolithic.tfstate"
  }
}


provider "azurerm" {
  features {}
   
}