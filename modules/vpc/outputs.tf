output "network" {
  description = "A reference (self_link) to the VPC network"
  value       = google_compute_network.network.self_link
}

// --- Public Subnetwork ---

output "public_subnetwork" {
  description = "A reference (self_link) to the public subnetwork"
  value       = google_compute_subnetwork.public_subnet.self_link
}

output "public_subnetwork_name" {
  description = "Name of the public subnetwork"
  value       = google_compute_subnetwork.public_subnet.name
}

output "public_subnetwork_cidr_block" {
  description = "The IP address block (in CIDR notation) assigned to the public subnetwork."
  value       = google_compute_subnetwork.public_subnet.ip_cidr_range
}

output "public_subnetwork_gateway" {
  description = "The IP address of the gateway assigned to the public subnetwork."
  value       = google_compute_subnetwork.public_subnet.gateway_address
}

output "public_subnetwork_secondary_cidr_block" {
  description = "The IP address block (in CIDR notation) assigned to the secondary IP ranges in the public subnetwork"
  value       = google_compute_subnetwork.public_subnet.secondary_ip_range[0].ip_cidr_range
}

output "public_subnetwork_secondary_range_name" {
  description = "The name of the secondary IP ranges assigned to the public subnetwork"
  value       = google_compute_subnetwork.public_subnet.secondary_ip_range[0].range_name
}