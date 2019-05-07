terragrunt = {
  terraform {
    source = "git::git@github.com:terraform-aws-modules/terraform-aws-iam.git//modules/iam-account?ref=v0.0.7"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

# MODULE PARAMETERS
account_alias = "acme-master"

minimum_password_length = 10

password_reuse_prevention = false

require_symbols = false
