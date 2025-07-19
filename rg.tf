locals {
  rg_net_name = "nb-fougor-${var.environment}-net-rg-01"

}

module "resource_group_net" {
  source = "git::https://github.com/alexandropinna/terraform-infra.git///modules/rg?ref=modules"

  rg_name     = local.rg_net_name
  rg_location = var.location

  tags = var.tags
}