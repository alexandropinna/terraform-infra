## --------------------------------------
##  LOCAL VARIABLES
## --------------------------------------

locals {
  tags = var.tags
}

## --------------------------------------
##  LANDING ZONE RESOURCE GROUP
## --------------------------------------

# Create a resource group in Azure

resource "azurerm_resource_group" "this" {
  name = var.rg_name

  location = var.rg_location

  tags = var.tags
}