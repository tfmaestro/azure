resource "azurerm_kubernetes_cluster" "aks_cluster" {
  for_each = toset([for i in range(var.cluster_count) : "${var.cluster_name}-${i + 1}"])

  name                = each.key
  location            = var.region
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-cluster-${each.value}"
  kubernetes_version  = var.kubernetes_version

  identity {
    type = "SystemAssigned"
  }
  default_node_pool {
    name            = "agentpool"
    node_count      = var.node_min_count
    vm_size         = var.node_machine_type
    os_disk_size_gb = 30
    max_pods        = 30
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = {
    environment = "prod"
  }
}
