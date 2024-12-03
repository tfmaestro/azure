variable "environment" {
  type    = string
  default = "prod"
}

variable "location" {
  description = "The location of the database"
  type        = string
  default     = "westus"
}

variable "admin_username" {
  description = "The administrator username for the MySQL server"
  type        = string
  sensitive   = true
}

variable "admin_password" {
  description = "The administrator password for the MySQL server"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "The SKU name for the MySQL server"
  type        = string
  default     = "GP_Standard_D2ds_v4"
}

variable "db_version" {
  description = "The version of the MySQL server"
  type        = string
  default     = "5.7"
}

variable "storage_size_gb" {
  description = "The size of the storage in GB for the MySQL server"
  type        = number
  default     = 20
}

variable "firewall_rules" {
  description = "Map of firewall rules configuration"
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "prod-rg"
}

variable "database_name" {
  description = "The database name."
  type        = string
  default     = "tfmaestro-mysql-database"
}
