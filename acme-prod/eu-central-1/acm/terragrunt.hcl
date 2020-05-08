terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-acm.git?ref=v2.5.0"
}

include {
  path = find_in_parent_folders()
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/acm/aws/2.5.0?tab=inputs
###########################################################
inputs = {

  domain_name = "acme-prod.com"

  validate_certificate = false # validated manually is separate AWS account

}
