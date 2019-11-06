variable "project_id" {
  description = "The project ID to host the project."
  type        = string
}

variable "env" {
  description = "The designated environment."
  type        = string
}

// --- Network ---

variable "region" {
  description = "Region to host VPC"
  type        = string
}

variable "network_cidr" {
  description = "The IP address range of the network in CIDR notation."
  type        = string
  default     = "10.0.0.0/16"
}

// --- Subnetwork ---

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


// --- Secondary IP Range ---

variable "secondary_cidr" {
  description = "The IP address range of the secondary IP addresses in CIDR notation."
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnet_secondary_cidr_delta" {
  description = "The delta between the subnet and secondary IP range netmask. If your subnet is /16, delta of 4 implies a secondary range of /20."
  type        = number
  default     = 4
}

variable "subnet_secondary_cidr_spacing" {
  description = "The spacing between each secondary IP range."
  type        = number
  default     = 0
}

