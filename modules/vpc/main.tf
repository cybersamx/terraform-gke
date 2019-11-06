terraform {
  required_version = ">= 0.12.10"
}

provider "google" {
  version = "~> 2.18.0"
  project = var.project_id
  region  = var.region
}

locals {
  subnet_public_spacing    = var.subnet_cidr_spacing
  subnet_secondary_spacing = var.subnet_secondary_cidr_spacing
}

// --- VPC Network ---

resource "google_compute_network" "network" {
  name = "${var.env}-network"

  project = var.project_id

  auto_create_subnetworks = false

  // For the most optimal option, use regional routing.
  routing_mode = "REGIONAL"
}

// --- Public Subnet ---

resource "google_compute_subnetwork" "public_subnet" {
  name = "${var.env}-subnet-public"

  project = var.project_id
  region  = var.region
  network = google_compute_network.network.self_link

  ip_cidr_range    = cidrsubnet(var.network_cidr, var.net_subnet_cidr_delta, local.subnet_public_spacing)

  // Alias IP addresses
  secondary_ip_range {
    range_name    = "${var.env}-public-secondary-ip-range"
    ip_cidr_range = cidrsubnet(var.secondary_cidr, var.subnet_secondary_cidr_delta, local.subnet_secondary_spacing)
  }
}