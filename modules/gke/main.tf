terraform {
  required_version = ">= 0.12.10"
}

provider "google" {
  version = "~> 2.18.0"
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  version = "~> 2.18.0"
  project = var.project_id
  region  = var.region
}

provider "template" {
  version = "~> 2.1"
}

// --- Computed Values ---

locals {
  cluster_name = "${var.env}-cluster"
}

// Use this resource provider to expose an access token for communication with GKE.
data "google_client_config" "client" {}

// Use this resource provider to access the Terraform account's email for Kubernetes permission.
data "google_client_openid_userinfo" "terraform_user" {}

// --- GKE Cluster ---

resource "google_container_cluster" "primary_cluster" {
  provider = google-beta

  // Base
  name = local.cluster_name
  project = var.project_id
  location = var.region

  // Network
  network = var.network
  subnetwork = var.subnetwork
  ip_allocation_policy {
    cluster_secondary_range_name = var.secondary_ip_range
    services_secondary_range_name = var.secondary_ip_range
  }

  // Addons and auxilliary services
  addons_config {
    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  node_pool {
    name = "default-pool"
    initial_node_count = var.initial_count

    autoscaling {
      max_node_count = var.max_count
      min_node_count = var.min_count
    }

    management {
      auto_repair  = true
      auto_upgrade = true
    }

    node_config {
      image_type   = "COS"
      machine_type = var.node_machine_type
      disk_size_gb = 10
      disk_type    = "pd-standard"
      preemptible  = false

      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
      ]
    }
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}