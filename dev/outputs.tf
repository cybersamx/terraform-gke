output "network" {
  description = "A reference (self_link) to the VPC network."
  value       = module.network.network
}

output "public_subnetwork" {
  description = "A reference (self_link) to the public subnetwork."
  value       = module.network.public_subnetwork
}

output "public_subnetwork_secondary_range_name" {
  description = "The name of the secondary range for the cluster to use."
  value       = module.network.public_subnetwork_secondary_range_name
}

output "name" {
  description = "The name of the cluster."

  value = module.cluster.name
}

output "cluster_endpoint" {
  description = "The IP address of the cluster master."
  sensitive   = true
  value       = module.cluster.cluster_endpoint
}

output "client_certificate" {
  description = "Public certificate used by clients to authenticate to the cluster endpoint."
  value       =  module.cluster.client_certificate
}

output "client_key" {
  description = "Private key used by client to connect to the cluster endpoint."
  sensitive   = true
  value       = module.cluster.client_key
}

output "cluster_ca_certificate" {
  description = "The public CA certificate for the cluster endpoint."
  sensitive   = true
  value       = module.cluster.cluster_ca_certificate
}

output "access_token" {
  description = "Access token to communicate with GKE cluster."
  value       = module.cluster.access_token
}