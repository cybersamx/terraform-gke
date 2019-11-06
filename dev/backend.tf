terraform {
  // Centralized location to save Terraform state
  backend "gcs" {
    bucket = "<PROJECT_ID>-tfstate"
    prefix = "dev"
  }
}
