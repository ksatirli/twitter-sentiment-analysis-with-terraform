terraform {
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/google/3.87.0
    google = {
      source  = "hashicorp/google"
      version = "3.87.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/random/3.1.0
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = "1.0.8"
}
