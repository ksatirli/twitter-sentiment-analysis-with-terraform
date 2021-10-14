# see https://www.terraform.io/docs/language/values/outputs.html
output "url_project_settings" {
  description = "URL for Project Settings in Console"
  value       = "${local.console_url_prefix}/iam-admin/settings?${local.console_url_suffix}"
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "url_service_account_overview" {
  description = "URL for Service Account Overview in Console"
  value       = "${local.console_url_prefix}/iam-admin/serviceaccounts?${local.console_url_suffix}"
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "url_service_account_detail" {
  description = "URL for Service Account Detail in Console"
  value       = "${local.console_url_prefix}/iam-admin/serviceaccounts/details/${google_service_account.sentiment_analysis.unique_id}?${local.console_url_suffix}"
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "url_workflows_overview" {
  description = "URL for Workflows Overview in Console"
  value       = "${local.console_url_prefix}/workflows?${local.console_url_suffix}"
}

# locals values for convenient usage of long Workflows URLs
locals {
  workflow_details_url_prefix = "${local.console_url_prefix}/workflows/workflow/${var.google_project_region}"
  workflow_details_url_suffix = "${google_workflows_workflow.sentiment_analysis.name}/executions?${local.console_url_suffix}"
  workflow_execution_url_suffix = "${google_workflows_workflow.sentiment_analysis.name}/create_execution?${local.console_url_suffix}"
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "url_workflow_details" {
  description = "URL for Workflow Details in Console"
  value       = "${local.workflow_details_url_prefix}/${local.workflow_details_url_suffix}"
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "url_workflow_execution" {
  description = "URL for Workflow Execution in Console"
  value       = "${local.workflow_details_url_prefix}/${local.workflow_execution_url_suffix}"
}
