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

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project#billing_account
variable "google_billing_account" {
  type        = string
  description = "The alphanumeric ID of the billing account this project belongs to."
}

# Depending on your setup, you may need to use `google_folder_id` instead of `google_org_id`.
# If that is the case, uncomment the next lines and update `main.tf` in the appropriate location.
# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project#folder_id
#variable "google_folder_id" {
#  type        = number
#  description = "The numeric ID of the folder this project belongs to."
#}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project#name
variable "google_org_id" {
  type        = number
  description = "The numeric ID of the organization this project belongs to."
}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project#name
variable "google_project_name" {
  type        = string
  description = "The display name of the project."
  default     = "Twitter Sentiment Analysis"

  validation {
    condition = (
      length(var.google_project_name) >= 4
      && length(var.google_project_name) <= 30
    )
    error_message = "The Project Name must be between 4 and 30 characters long."
  }
}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project#name
variable "google_project_id" {
  type        = string
  description = "The project ID."
  default     = "twitter-sentiment"

  validation {
    condition     = (length(var.google_project_id) <= 25)
    error_message = "The Project ID must be at most 25 characters long."
  }
}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam#role
variable "iam_roles" {
  type        = list(string)
  description = "The list of role(s) that should be applied."

  default = [
    "roles/serviceusage.serviceUsageConsumer"
  ]
}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service#service
variable "project_services" {
  type        = list(string)
  description = "List of services to enable."

  default = [
    "language.googleapis.com",
    "workflows.googleapis.com",
  ]
}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workflows_workflow#description
variable "workflow_description" {
  type        = string
  description = "Description of the workflow provided by the user."
  default     = "Twitter Sentiment Analysis"

  validation {
    condition     = (length(var.workflow_description) <= 1000)
    error_message = "The Workflow Description must be at most 1000 characters long."
  }
}

locals {
  # Google Project IDs must be globally unique, so we are adding a random string
  google_project_id = "${random_string.four.keepers.project_id}-${random_string.four.id}"

  # A set of key/value label pairs to assign to all resources.
  # Each value may not exceed 63 characters
  labels = { }

  # prefix and suffix for URLs for Google Cloud Console
  console_url_prefix = "https://console.cloud.google.com"
  console_url_suffix = "organizationId=${var.google_org_id}&project=${google_project.sentiment_analysis.project_id}"
}
