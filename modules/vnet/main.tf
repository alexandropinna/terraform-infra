# Define an Azure virtual network

resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.rg_name
  address_space       = var.vnet_addressprefixes

  tags = var.tags
}