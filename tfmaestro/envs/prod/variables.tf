variable "name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "location" {
  description = "Location for the resources"
  type        = string
  default     = "westus"
}

variable "environment" {
  description = "Environment for the resources"
  type        = string
}

# variable "resource_group_name" {
#   description = "Name of the resource group"
#   type        = string
# }
