terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=v2.18.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../aws-data"]
}

dependency "aws-data" {
  config_path = "../aws-data"
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.18.0?tab=inputs
###########################################################
inputs = {
  # A list of availability zones in the region
  # type: list(string)
  azs = [for v in dependency.aws-data.outputs.available_aws_availability_zones_names : v]

  # The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden
  # type: string
  cidr = "10.0.0.0/16"

  # A list of database subnets
  # type: list(string)
  database_subnets = [for k, v in dependency.aws-data.outputs.available_aws_availability_zones_names : cidrsubnet("10.0.0.0/16", 8, k + 20)]

  # Name to be used on all the resources as identifier
  # type: string
  name = "prod"

  # A list of private subnets inside the VPC
  # type: list(string)
  private_subnets = [for k, v in dependency.aws-data.outputs.available_aws_availability_zones_names : cidrsubnet("10.0.0.0/16", 8, k + 10)]

  # A list of public subnets inside the VPC
  # type: list(string)
  public_subnets = [for k, v in dependency.aws-data.outputs.available_aws_availability_zones_names : cidrsubnet("10.0.0.0/16", 8, k)]

  enable_nat_gateway = true

  single_nat_gateway = true

  enable_dns_hostnames = true

  enable_dns_support = true

  tags = {
    Environment = "prod"
  }

}
