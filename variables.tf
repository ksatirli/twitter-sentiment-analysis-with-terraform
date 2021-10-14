# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started#configuring-the-provider
variable "google_project_region" {
  type        = string
  description = "The region will be used to choose the default location for regional resources."

  # see https://cloud.google.com/compute/docs/regions-zones
  default = "us-central1" # Council Bluffs, Iowa, North America

  validation {
    condition     = can(contains(["us-central1", "asia-southeast1", "europe-west4"], var.google_project_region))
    error_message = "The Workflows Region must be one of \"us-central1\", \"asia-southeast1\", or \"europe-west4\"."
  }
}

