# [DEPRECATED] This is an empty directory without any Terraform code

This module is not needed since Terragrunt version 0.18.4 has native support for [skipping modules](https://github.com/gruntwork-io/terragrunt#skip) (set `skip = true` in `terraform.tfvars`).

## Why this is/was needed?

The main reason is that in order to use before&after hooks in Terragrunt (eg, `terragrunt init`) the Terraform configuration code should be always sourced from Terraform modules. And this module acts as a simple module wrapper.
