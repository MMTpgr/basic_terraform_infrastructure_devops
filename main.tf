terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "grp"
    storage_account_name  = "vaullerey"
    container_name        = "blob"
    key                   = "prod.terraform.tfstate"
    
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "my_resource_group" {
  name     = "my-resource-group"
  location = "East US"
}


# Call the network module opopa
module "network" {
  source      = "./modules/network"
  vnet_name   = var.vnet_name
  address_space = var.address_space
  subnet_name = var.subnet_name
  subnet_prefix = var.subnet_prefix
  resource_group_name = var.resource_group_name
  location    = var.location
  depends_on = [ azurerm_resource_group.my_resource-group ]
}

# Call the compute module
module "compute" {
  source              = "./modules/compute"
  vm_name             = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  
}

# Call the storage module
module "storage" {
  source              = "./modules/storage"
  storage_account_name = var.storage_account_name
  resource_group_name = var.resource_group_name
  location            = var.location
  depends_on = [ azurerm_resource_group.my_resource-group ]
}
