################################
# --- Global 
################################ 

# Variable for the environment of the project
variable "project" {
  description = "Project for the Project"
  type        = string
  default     = "l2sa7o"
}

variable "environment" {
  description = "Environment for the Project"
  type        = string
  default     = "dev"
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = "4c309d30-ded6-415c-951c-56faffb7c885"
}

################################
# --- Resource Groups 
################################
# Variable for the resource group location
variable "location" {
  description = "Region location for the resource group"
  type        = string
  default     = "canadacentral"
}

variable "tags" {
  description = "A map of tags for the Resource Group"
  type        = map(string)
  default = {
    CreatedWith = "Terraform"
  }
}

################################
# --- Virtual Network
################################
# Variable for the address prefixes of the virtual network
variable "vnet_addressprefixes" {
  description = "Address prefixes for the virtual network"
  type        = list(string)
  default     = ["10.70.0.0/16"]
}