provider "azurerm" {
  features {}
  subscription_id = "22d0cfe3-b300-4101-a6b1-a6ae9ee75853"
}

resource "azurerm_resource_group" "my_resource-group" {
  name = var.resource_group_name
  location = var.location
}

# Call the network module
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