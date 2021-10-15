# Inputs and Outputs

For an overview of all input variables and output values, see below.

## Inputs

For an overview of all input variables and output values, see [docs/inputs-and-outputs.md](./docs/inputs-and-outputs.md).

This section contains the [Input Variables](https://www.terraform.io/docs/language/values/variables.html) for this repository.

These values are defined in `variables.tf` and can be overridden by duplicating `terraform.tfvars.sample` and storing it as `terraform.tfvars`.

| Name                   | Description                                                                    | Type           | Default                                                                           | Required |
|------------------------|--------------------------------------------------------------------------------|----------------|-----------------------------------------------------------------------------------|:--------:|
| google_billing_account | The alphanumeric ID of the billing account this project belongs to.            | `string`       | n/a                                                                               | yes      |
| google_org_id          | The numeric ID of the organization this project belongs to.                    | `number`       | n/a                                                                               | yes      |
| google_project_id      | The project ID.                                                                | `string`       | `"twitter-sentiment"`                                                             | no       |
| google_project_name    | The display name of the project.                                               | `string`       | `"Twitter Sentiment Analysis"`                                                    | no       |
| google_project_region  | The region will be used to choose the default location for regional resources. | `string`       | `"us-central1"`                                                                   | no       |
| iam_roles              | The list of role(s) that should be applied.                                    | `list(string)` | <pre>[<br>  "roles/serviceusage.serviceUsageConsumer"<br>]</pre>                  | no       |
| project_services       | List of services to enable.                                                    | `list(string)` | <pre>[<br>  "language.googleapis.com",<br>  "workflows.googleapis.com"<br>]</pre> | no       |
| workflow_description   | Description of the workflow provided by the user.                              | `string`       | `"Twitter Sentiment Analysis"`                                                    | no       |

## Outputs

This section contains the [Output Values](https://www.terraform.io/docs/language/values/outputs.html) for this repository.

| Name                         | Description                                 |
|------------------------------|---------------------------------------------|
| url_project_settings         | URL for Project Settings in Console         |
| url_service_account_detail   | URL for Service Account Detail in Console   |
| url_service_account_overview | URL for Service Account Overview in Console |
| url_workflow_details         | URL for Workflow Details in Console         |
| url_workflow_execution       | URL for Workflow Execution in Console       |
| url_workflows_overview       | URL for Workflows Overview in Console       |
