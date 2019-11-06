variable "project_id" {
  description = "The project ID to host the network."
  type        = string
}

variable "region" {
  description = <<-EOF
  Region to host the network. For a list of all regions, see:
  https://cloud.google.com/compute/docs/regions-zones/
  EOF
  type        = string
}

variable "env" {
  description = "The designated environment."
  type        = string
}

variable "network_cidr" {
  description = "The IP address range of the network in CIDR notation."
  default     = "10.0.0.0/16"
  type        = string
}

variable "net_subnet_cidr_delta" {
  description = "The delta between the network and subnetwork netmask. If your network is /16, delta of 4 implies a subnet of /20."
  type        = number
  default     = 4
}

variable "subnet_cidr_spacing" {
  description = "The spacing between each subnetwork."
  type        = number
  default     = 0
}