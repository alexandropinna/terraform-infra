# Resource Group Module

This module creates an Azure Resource Group with configurable location and tags.

## Description

The Resource Group module provides a simple and standardized way to create Azure Resource Groups. It includes support for custom naming, location specification, and tag management for resource organization and governance.

## Features

- Creates Azure Resource Group in specified location
- Configurable resource group name and location
- Tag support for resource management and billing
- Simple and reusable design

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `rg_name` | Name of the resource group to be deployed | `string` | `"rg-test"` | no |
| `rg_location` | The location/region to keep all your resources | `string` | `"canadacentral"` | no |
| `tags` | Tags to be assigned to the resource group | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `id` | The ID of the created resource group |
| `name` | The name of the created resource group |
| `location` | The location of the created resource group |

## Usage Example

```hcl
module "resource_group_example" {
  source = "./modules/rg"

  rg_name     = "my-project-rg-01"
  rg_location = "eastus"

  tags = {
    Environment = "dev"
    Project     = "MyProject"
    Owner       = "DevOps Team"
  }
}

# Reference outputs from other modules
resource "azurerm_storage_account" "example" {
  name                = "mystorageaccount"
  resource_group_name = module.resource_group_example.name
  location           = module.resource_group_example.location
  # ... other configuration
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| azurerm | >= 3.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Authors

Module managed by the DevOps team.

## License

This module is licensed under the MIT License. 