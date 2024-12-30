variable "region" {
  description = "The region for GKE clusters"
  type        = string
}

variable "cluster_count" {
  description = "Number of Kubernetes clusters to create"
  type        = number
  default     = 1
}

variable "node_machine_type" {
  description = "Machine type for the node pool"
  type        = string
  default     = "e2-medium"
}

variable "node_min_count" {
  description = "Minimum number of nodes for autoscaling"
  type        = number
  default     = 1
}

variable "node_max_count" {
  description = "Maximum number of nodes for autoscaling"
  type        = number
}

