output "cluster_name" {
  value = module.kubernetes.cluster_name
}

output "cluster_url" {
  value     = module.kubernetes.cluster_url
  sensitive = true
}