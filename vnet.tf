locals {
  vnet_name = "nb-fougor-${var.environment}-cace-vnet-01"
}

module "vnet" {
  source = "git::https://github.com/alexandropinna/terraform-infra.git///modules/vnet?ref=modules"

  vnet_name            = local.vnet_name
  vnet_location        = var.location
  rg_name              = module.resource_group_net.name
  vnet_addressprefixes = var.vnet_addressprefixes

  tags = var.tags

}