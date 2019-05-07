terragrunt = {
  terraform {
    source = "git::git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=v1.59.0"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

name = "prod"

# Visual subnet calculator - http://www.davidc.net/sites/default/subnets/subnets.html?network=10.10.0.0&mask=16&division=31.f4627231
cidr = "10.10.0.0/16"

azs = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]

private_subnets = ["10.10.0.0/20", "10.10.16.0/20", "10.10.32.0/20"]

public_subnets = ["10.10.64.0/20", "10.10.80.0/20", "10.10.96.0/20"]

database_subnets = ["10.10.128.0/20", "10.10.144.0/20", "10.10.160.0/20"]

elasticache_subnets = ["10.10.176.0/20", "10.10.192.0/20", "10.10.208.0/20"]

create_database_subnet_group = false

create_elasticache_subnet_group = false

enable_nat_gateway = true

single_nat_gateway = true

enable_dns_hostnames = true

enable_dns_support = true

tags = {
  Environment = "prod"
}
