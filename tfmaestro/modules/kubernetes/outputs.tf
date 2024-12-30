output "cluster_name" {
  value = [for cluster in azurerm_kubernetes_cluster.aks_cluster : cluster.name]
}

output "cluster_url" {
  value = [for cluster in azurerm_kubernetes_cluster.aks_cluster : cluster.kube_config_raw]
}