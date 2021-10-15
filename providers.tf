# see https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  region = var.google_project_region
}

# see https://registry.terraform.io/providers/hashicorp/random/latest
provider "random" {}
