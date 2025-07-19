# Virtual Network Module

This module creates an Azure Virtual Network with configurable address space and location.

## Description

The Virtual Network module provides a simple and standardized way to create Azure Virtual Networks. It supports custom naming, flexible address space configuration, and tag management for resource organization and governance.

## Features

- Creates Azure Virtual Network in specified location
- Configurable address space with multiple prefixes support
- Resource group and location specification
- Tag support for resource management and billing
- Simple and reusable design

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `vnet_name` | Virtual network name | `string` | n/a | yes |
| `vnet_location` | Location of virtual network resource to deploy | `string` | n/a | yes |
| `rg_name` | Name of the resource group where the virtual network will be deployed | `string` | n/a | yes |
| `vnet_addressprefixes` | Virtual network address space range | `list(string)` | n/a | yes |
| `tags` | Tags to be applied to the resource | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| `id` | ID of the Virtual Network |
| `name` | Name of the Virtual Network |

## Usage Example

### Basic Virtual Network

```hcl
module "virtual_network_basic" {
  source = "./modules/vnet"

  vnet_name     = "my-vnet-01"
  vnet_location = "eastus"
  rg_name       = "my-network-rg"
  
  vnet_addressprefixes = ["10.0.0.0/16"]

  tags = {
    Environment = "dev"
    Project     = "MyProject"
    Owner       = "NetworkTeam"
  }
}
```

### Multi-CIDR Virtual Network

```hcl
module "virtual_network_multi_cidr" {
  source = "./modules/vnet"

  vnet_name     = "my-enterprise-vnet"
  vnet_location = "westus2"
  rg_name       = "enterprise-network-rg"
  
  # Multiple address spaces for complex networking
  vnet_addressprefixes = [
    "10.0.0.0/16",
    "10.1.0.0/16",
    "172.16.0.0/12"
  ]

  tags = {
    Environment = "production"
    Project     = "EnterpriseNetwork"
    Owner       = "NetworkOps"
    CostCenter  = "IT-001"
  }
}

# Example of using outputs in other resources
resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = module.virtual_network_multi_cidr.name
  virtual_network_name = module.virtual_network_multi_cidr.name
  address_prefixes     = ["10.0.1.0/24"]
}
```

### Hub Virtual Network for Hub-Spoke Architecture

```hcl
module "hub_virtual_network" {
  source = "./modules/vnet"

  vnet_name     = "hub-vnet-01"
  vnet_location = "centralus"
  rg_name       = "hub-network-rg"
  
  # Hub network typically uses smaller address space
  vnet_addressprefixes = ["10.100.0.0/16"]

  tags = {
    Environment = "shared"
    NetworkType = "hub"
    Project     = "HubSpoke"
    Owner       = "NetworkArchitecture"
  }
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
| [azurerm_virtual_network.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Notes

- Address prefixes must be valid CIDR notation
- Virtual network name must be unique within the resource group
- Multiple address prefixes can be specified for complex networking scenarios
- Consider Azure's networking limits when planning address spaces

## Authors

Module managed by the DevOps team.

## License

This module is licensed under the MIT License. 