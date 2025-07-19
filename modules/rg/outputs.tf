# Output the ID of the created resource group
output "id" {
  value = azurerm_resource_group.this.id
}

# Output the name of the created resource group
output "name" {
  value = azurerm_resource_group.this.name
}

# Output the location of the created resource group
output "location" {
  value = azurerm_resource_group.this.location
}