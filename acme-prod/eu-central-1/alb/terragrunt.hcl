terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-alb.git?ref=v5.4.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../acm", "../vpc", "../alb-security-group"]
}

dependency "acm" {
  config_path = "../acm"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "alb-security-group" {
  config_path = "../alb-security-group"
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/5.4.0?tab=inputs
###########################################################
inputs = {
  name = "acme-prod"

  vpc_id = dependency.vpc.outputs.vpc_id

  subnets = dependency.vpc.outputs.public_subnets

  security_groups = [dependency.alb-security-group.outputs.this_security_group_id]

  ip_address_type = "dualstack"

  enable_deletion_protection = true

  drop_invalid_header_fields = true

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = 443
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    },
  ]

  https_listeners = [
    {
      target_group_index = 0
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = dependency.acm.outputs.this_acm_certificate_arn
      action_type        = "redirect"
      redirect = {
        port        = 443
        protocol    = "HTTPS"
        status_code = "HTTP_302"
        host        = "github.com"
        path        = "/antonbabenko/terraform-cost-estimation"
        query       = ""
      }
    },
  ]

  target_groups = [
    {
      name_prefix                        = "l1-"
      target_type                        = "lambda"
      lambda_multi_value_headers_enabled = true
    },
  ]
}
