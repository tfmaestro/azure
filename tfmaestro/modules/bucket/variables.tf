variable "name" {
  description = "The name of the storage account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location/region where the storage account will be created."
  type        = string
}

variable "main_page_suffix" {
  description = "The name of the index document for the static website."
  type        = string
}

variable "not_found_page" {
  description = "The name of the 404 error page for the static website."
  type        = string
}