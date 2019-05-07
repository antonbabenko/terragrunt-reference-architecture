terragrunt = {
  terraform {
    source = "git::git@github.com:terraform-aws-modules/terraform-aws-iam.git//modules/iam-account?ref=v0.0.7"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# MODULE PARAMETERS
account_alias = "acme-prod"
