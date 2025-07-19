# Variable for the name of the virtual network
variable "vnet_name" {
  type        = string
  description = "vnet name."
}

# Variable for the location of the virtual network
variable "vnet_location" {
  type        = string
  description = "location of vnet resource to deploy."
}

# Variable for the name of the resource group
variable "rg_name" {
  type        = string
  description = "Name of the resource group is to be deployed"
}

# Variable for the address space of the virtual network
variable "vnet_addressprefixes" {
  type        = list(string)
  description = "Vnet Address Space range will specify here."
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to the resource."
}
