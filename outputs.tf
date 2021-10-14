# see https://www.terraform.io/docs/language/values/outputs.html
output "console_url_project_settings" {
  description = "URL for Project Settings in Console"
  value       = "${local.console_url_prefix}/iam-admin/settings?${local.console_url_suffix}"
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "console_url_service_account_overview" {
  description = "URL for Service Account Overview in Console"
  value       = "${local.console_url_prefix}/iam-admin/serviceaccounts?${local.console_url_suffix}"
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "console_url_service_account_detail" {
  description = "URL for Service Account Detail in Console"
  value       = "${local.console_url_prefix}/iam-admin/serviceaccounts/details/${google_service_account.sentiment_analysis.unique_id}?${local.console_url_suffix}"
}

# see https://www.terraform.io/docs/language/values/outputs.html
output "console_url_workflows_overview" {
  description = "URL for Workflows Overview in Console"
  value       = "${local.console_url_prefix}/workflows?${local.console_url_suffix}"
}

