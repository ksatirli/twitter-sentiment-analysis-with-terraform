# see https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "four" {
  length  = 4
  lower   = true
  special = false
  upper   = false

  # see https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string#optional
  keepers = {
    # regenerate this, every time `var.google_project_id` changes
    project_id = var.google_project_id
  }
}
