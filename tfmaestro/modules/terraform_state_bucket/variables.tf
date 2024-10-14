variable "environment" {
  description = "The environment for the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the storage account will be created"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "log_container_name" {
  description = "The name of the log container"
  type        = string
}

variable "container_access_type" {
  description = "The name of the log container"
  type        = string
  default     = "private"
}