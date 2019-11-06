output "name" {
  description = "The name of the cluster."

  value = google_container_cluster.primary_cluster.name
}

output "cluster_endpoint" {
  description = "The IP address of the cluster master."
  sensitive   = true
  value       = google_container_cluster.primary_cluster.endpoint
}

output "client_certificate" {
  description = "Public certificate used by clients to authenticate to the cluster endpoint."
  value       = base64decode(google_container_cluster.primary_cluster.master_auth[0].client_certificate)
}

output "client_key" {
  description = "Private key used by client to connect to the cluster endpoint."
  sensitive   = true
  value       = base64decode(google_container_cluster.primary_cluster.master_auth[0].client_key)
}

output "cluster_ca_certificate" {
  description = "The public CA certificate for the cluster endpoint."
  sensitive   = true
  value       = base64decode(google_container_cluster.primary_cluster.master_auth[0].cluster_ca_certificate)
}

output "access_token" {
  description = "Access token to communicate with GKE cluster."
  value       = data.google_client_config.client.access_token
}