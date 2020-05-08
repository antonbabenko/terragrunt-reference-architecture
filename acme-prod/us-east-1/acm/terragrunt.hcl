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

  domain_name = "acme2.com"

  subject_alternative_names = [
    "*.acme.com",
    "*.cdn.acme.com",
    "*.acme2.com",
    "*.cdn.acme2.com",
  ]

  zone_id = "Z34ZYFQX4QMAA1" # public_route53_zone_id. Zones are managed inside eu-central-1 region inside route53-zones

  # Do not wait for validation, because several subdomains records should be created.
  # It is easier to click "Create record in Route 53" once certificates are created manually on this link:
  # https://console.aws.amazon.com/acm/home?region=us-east-1
  wait_for_validation = false

  validate_certificate = false

  tags = {
    Name = "acme.com"
  }

}
