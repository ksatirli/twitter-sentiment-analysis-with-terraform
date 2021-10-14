# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_organization_policy
#resource "google_organization_policy" "skip_default_network_creation" {
#  org_id     = var.google_org_id
#  constraint = "constraints/compute.skipDefaultNetworkCreation"
#
#  boolean_policy {
#    enforced = true
#  }
#}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project
resource "google_project" "sentiment_analysis" {
  billing_account = var.google_billing_account

  # If your setup requires the usage of `folder_id`, uncomment `folder_id` on the
  # next line and edit `variables.tf` to uncomment the `google_folder_id` variable.
  # folder_id = var.google_folder_id

  labels = local.labels
  name   = var.google_project_name

  # Comment the next line if your setup requires `folder_id` instead of `org_id`
  org_id = var.google_org_id

  project_id = local.google_project_id
}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "sentiment_analysis" {
  account_id   = local.google_project_id
  display_name = var.google_project_name
  project      = google_project.sentiment_analysis.project_id
}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_member" "sentiment_analysis" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for role in var.iam_roles :
    role => role
  }

  member  = "serviceAccount:${google_service_account.sentiment_analysis.email}"
  project = google_project.sentiment_analysis.project_id
  role    = each.key
}

resource "google_project_service" "services" {
  # see https://www.terraform.io/docs/language/meta-arguments/for_each.html
  for_each = {
    for service in var.project_services :
    service => service
  }

  disable_dependent_services = false
  disable_on_destroy         = true
  project                    = google_project.sentiment_analysis.project_id
  service                    = each.key

  # see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service#timeouts
  timeouts {
    create = "30m"
    update = "45m"
  }
}

# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workflows_workflow
resource "google_workflows_workflow" "sentiment_analysis" {
  description     = var.workflow_description
  labels          = local.labels
  name            = local.google_project_id
  region          = var.google_project_region
  project         = google_service_account.sentiment_analysis.project
  service_account = google_service_account.sentiment_analysis.id
  source_contents = file("./templates/twitter-sentiment.yml")

  depends_on = [
    google_project_service.services
  ]
}
