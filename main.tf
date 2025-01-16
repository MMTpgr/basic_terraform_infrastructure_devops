provider "azurerm" {
  features {}
  subscription_id = "22d0cfe3-b300-4101-a6b1-a6ae9ee75853"
}
resource "azurerm_resource_group" "examplek" {
  name     = "example-resources"
  location = "East US"
}

variable "hajouj" {
  type = "string"
  description = "value"
}

resource "azurerm_storage_account" "exampley" {
  name                     = "storageaccountnameeee"
  resource_group_name      = azurerm_resource_group.examplek.name
  location                 = azurerm_resource_group.examplek.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  

  
}