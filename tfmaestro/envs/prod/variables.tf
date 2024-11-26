variable "name" {
  type = string
}

variable "environment" {
  type = string
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
  description = "Type of environment"
  type        = string
}

