terraform {
  required_version = ">= 0.12.10"
}

module "network" {
  source     = "../modules/vpc"
  project_id = var.project_id
  region     = var.region
  env        = var.env

  network_cidr          = var.network_cidr
  net_subnet_cidr_delta = var.net_subnet_cidr_delta
  subnet_cidr_spacing   = var.subnet_cidr_spacing
}

module "cluster" {
  source     = "../modules/gke"
  project_id = var.project_id
  region     = var.region
  env        = var.env

  // Compute
  node_machine_type = "g1-small"
  initial_count     = 1
  max_count         = 5
  min_count         = 1

  // Service
  cluster_service_account_name        = "${var.env}-sa-cluster"
  cluster_service_account_description = "Service account for GKE cluster"

  // Network
  network            = module.network.network
  subnetwork         = module.network.public_subnetwork
  secondary_ip_range = module.network.public_subnetwork_secondary_range_name
}