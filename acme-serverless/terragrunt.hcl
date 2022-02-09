terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

#    required_var_files = [
#      find_in_parent_folders("common.tfvars"),
#    ]

#    optional_var_files = [
#      for i in range(5): find_in_parent_folders("regional${i}.tfvars")
#    ]

  }

  extra_arguments "disable_input" {
    commands  = get_terraform_commands_that_need_input()
    arguments = ["-input=false"]
  }
}

generate "main_providers" {
  path      = "main_providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = "eu-west-1"

  # Make it faster by skipping something
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
}
EOF
}

remote_state {
  backend      = "s3"
  disable_init = tobool(get_env("TERRAGRUNT_DISABLE_INIT", "false"))

  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite"
  }

  config = {
    encrypt        = true
    region         = "eu-west-1"
    key            = format("%s/terraform.tfstate", path_relative_to_include())
    bucket         = format("terraform-states-%s", get_aws_account_id())
    dynamodb_table = format("terraform-states-%s", get_aws_account_id())

    skip_metadata_api_check     = true
    skip_credentials_validation = true
  }
}
