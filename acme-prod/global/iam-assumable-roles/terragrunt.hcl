terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-iam.git//modules/iam-assumable-roles?ref=v2.9.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../iam-account"]
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/2.9.0/submodules/iam-assumable-roles?tab=inputs
###########################################################
inputs = {

  # Role ARN who should be allowed to assume role in this AWS account
  # (by default, it is "acme-master" AWS account)
  trusted_role_arns = ["arn:aws:iam::333333333333:root"]

  mfa_age = 86400

  max_session_duration = 43200

  create_admin_role = true

  admin_role_name = "admin"

  admin_role_requires_mfa = true

  create_poweruser_role = true

  poweruser_role_name = "developer"

  poweruser_role_requires_mfa = false

  create_readonly_role = true

  readonly_role_name = "readonly"

  readonly_role_requires_mfa = false

}
