data "azurerm_subnet" "prod_subnet" {
  name                 = "prod-database-public-subnet-01"
  virtual_network_name = "prod-vnet"
  resource_group_name  = var.resource_group_name
}

resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                         = "tfmaestro-db-${var.environment}-mysql"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  sku_name                     = var.sku_name
  version                      = var.db_version
  administrator_login          = var.admin_username
  administrator_password       = var.admin_password
  delegated_subnet_id          = data.azurerm_subnet.prod_subnet.id
  backup_retention_days        = 1
  geo_redundant_backup_enabled = false

  storage {
    size_gb            = var.storage_size_gb
    auto_grow_enabled  = false
    io_scaling_enabled = false
  }
}

resource "azurerm_mysql_flexible_server_firewall_rule" "firewall_rule" {
  for_each            = var.firewall_rules
  name                = "${each.key}-firewall-rule"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql_server.name
  start_ip_address    = each.value.start_ip_address
  end_ip_address      = each.value.end_ip_address
}

resource "azurerm_mysql_flexible_database" "mysql_database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"

  depends_on = [azurerm_mysql_flexible_server.mysql_server]
}

