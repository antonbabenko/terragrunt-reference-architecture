terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-iam.git//modules/iam-account?ref=v2.9.0"
}

include {
  path = find_in_parent_folders()
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/2.9.0/submodules/iam-account?tab=inputs
###########################################################
inputs = {

  account_alias = "acme-prod"

}
