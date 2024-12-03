variable "environment" {
  type = string
}

variable "admin_password" {
  description = "The administrator password for the MySQL server"
  type        = string
  sensitive   = true
}

variable "admin_username" {
  description = "The administrator username for the MySQL server"
  type        = string
  sensitive   = true
}

variable "firewall_rules" {
  description = "Map of firewall rules configuration"
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
}

variable "location" {
  description = "The location of the database"
  type        = string
  default     = "westus"
}

variable "mysql_server_name" {
  description = "The name of the MySQL server."
  type        = string
  default     = "tfmaestro-db-prod-mysql"
}
