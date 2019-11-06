variable "project_id" {
  description = "The project ID to host the cluster."
  type        = string
}

variable "env" {
  description = "The designated environment for the cluster."
  type        = string
}

variable "region" {
  description = "The region to host the cluster."
  type        = string
}

// --- Service Account ---

variable "cluster_service_account_name" {
  description = "The name of the custom service account used in the cluster."
  type        = string
  default     = "sa-cluster"
}

variable "cluster_service_account_description" {
  description = "A description of the custom service account used in the cluster."
  type        = string
  default     = "GKE service account"
}

variable "service_account_roles" {
  description = "A list of roles associated with the service account. Please use a more restrictive set of roles when deploying to production."
  type = list(string)
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/stackdriver.resourceMetadata.writer",
    "roles/compute.admin",
    "roles/storage.admin"
  ]
}

variable "network" {
  description = "The VPC to host the cluster."
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster."
  type        = string
}

variable "secondary_ip_range" {
  description = "The name of the secondary subnet ip range to use for Kubernetes services. Both pods and service will share the same secondary IP range."
  type        = string
}

variable "node_machine_type" {
  description = "The machine type associated with the nodes in the cluster."
  type        = string
  default     = "n1-standard-1"
}

variable "initial_count" {
  description = "The number of nodes to start with in the node pool. Value must be at least 1."
  type        = number
  default     = 3
}

variable "min_count" {
  description = "Minimum number of nodes in the node pool."
  type        = number
  default     = 1
}

variable "max_count" {
  description = "Maximum number of nodes in the node pool."
  type        = number
  default     = 5
}