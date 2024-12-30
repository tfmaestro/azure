provider "azurerm" {
  features {}
}

module "kubernetes" {
  source            = "../../../modules/kubernetes"
  region            = var.region
  cluster_count     = var.cluster_count
  node_machine_type = var.node_machine_type
  node_min_count    = var.node_min_count
  node_max_count    = var.node_max_count
}