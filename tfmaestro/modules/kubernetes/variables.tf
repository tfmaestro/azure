variable "name" {
  description = "Name of the virtual network"
  type        = string
  default     = "prod"
}

variable "region" {
  description = "The Azure region"
  type        = string
}

variable "kubernetes_version" {
  description = "The Kubernetes version"
  type        = string
  default     = "1.30"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "prod-rg"
}

variable "cluster_count" {
  description = "Number of AKS clusters to create"
  type        = number
}

variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
  default     = "tfmaestro-cluster-k8s"
}

variable "node_machine_type" {
  description = "The machine type for the nodes"
  type        = string
}

variable "node_min_count" {
  description = "The minimum number of nodes in the cluster"
  type        = number
}

variable "node_max_count" {
  description = "The maximum number of nodes in the cluster"
  type        = number
}

