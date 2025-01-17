data "azurerm_virtual_network" "vnet" {
  name                = "prod-vnet"
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "public_subnet" {
  name                 = "prod-public-subnet-01"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group_name
}

data "azurerm_virtual_machine" "vm" {
  for_each            = toset(["tfmaestro-web-app-01", "tfmaestro-web-app-02"])
  name                = each.key
  resource_group_name = var.resource_group_name
}

data "azurerm_network_interface" "main" {
  for_each = data.azurerm_virtual_machine.vm
  name     = "${each.key}-nic"
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "prod_lb_public_ip" {
  name                = "tfmaestro-lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "prod_lb" {
  name                = "tfmaestro-load-balancer"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public_ip.prod_lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "prod_lb_pool" {
  loadbalancer_id = azurerm_lb.prod_lb.id
  name            = "tfmaestro-lb-pool"
}

resource "azurerm_lb_probe" "prod_lb_probe" {
  loadbalancer_id = azurerm_lb.prod_lb.id
  name            = "http-probe"
  protocol        = "Http"
  port            = 80
  request_path    = "/health"
}

resource "azurerm_lb_rule" "prod_lb_rule" {
  loadbalancer_id                = azurerm_lb.prod_lb.id
  name                           = "http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontend-ip"
  probe_id                       = azurerm_lb_probe.prod_lb_probe.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.prod_lb_pool.id]
}

resource "azurerm_network_interface_backend_address_pool_association" "prod_nic_lb_pool" {
  for_each                    = data.azurerm_virtual_machine.vm
  network_interface_id        = data.azurerm_network_interface.main[each.key].id
  backend_address_pool_id     = azurerm_lb_backend_address_pool.prod_lb_pool.id
  ip_configuration_name       = "${each.key}-ip-config"
}
