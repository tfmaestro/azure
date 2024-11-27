variable "environment" {
  type = string
  default = "prod"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
}

variable "vm_config" {
  type = map(object({
    private_ip       = string
    public_ip_name   = string
    machine_type     = string
    machine_description = string
  }))
}

variable "network_name" {
  description = "The name of the network"
  type        = string
}