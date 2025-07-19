variable "rg_name" {
  type        = string
  description = "Name of the resource group to be deployed"
  default     = "rg-test"
}

variable "rg_location" {
  description = "The location/region to keep all your resources."
  default     = "canadacentral"
}

variable "tags" {
  description = "Tags to be assigned to the resource group."
  type        = any
}