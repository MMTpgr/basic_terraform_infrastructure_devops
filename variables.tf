variable "vnet_name" {
  default = "my-vnet"
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  default = "my-subnet"
}

variable "subnet_prefix" {
  default = "10.0.1.0/24"
}

variable "resource_group_name" {
  default = "my-resource-group"
}

variable "location" {
  default = "eastus"
}

variable "vm_name" {
  default = "my-vm"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  description = "Password for the VM admin user"
  default = "MedTag!2005@"
  sensitive   = true
}

variable "storage_account_name" {
  default = "imperialcapitalvault"
}
