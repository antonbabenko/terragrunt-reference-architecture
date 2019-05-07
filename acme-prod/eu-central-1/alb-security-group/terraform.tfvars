terragrunt = {
  terraform {
    source = "git::git@github.com:terraform-aws-modules/terraform-aws-security-group.git"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }

  dependencies {
    paths = ["../vpc"]
  }
}

# Name of security group
name = "acme-prod-alb"

# Description for security group
description = "Security group for the public Application Load Balancer"

# ID of the VPC where to create security group
vpc_id = "vpc-123" # @tfvars:terragrunt_output.vpc.vpc_id

ingress_cidr_blocks = ["0.0.0.0/0"]

ingress_rules = ["http-80-tcp", "https-443-tcp"]

egress_with_cidr_blocks = [
  {
    rule        = "all-all"
    cidr_blocks = "0.0.0.0/0"
  },
]
