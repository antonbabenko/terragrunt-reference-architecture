terraform {
  source = "git::git@github.com:doingcloudright/terraform-aws-ecr-cross-account.git?ref=1.0.1"
}

include {
  path = find_in_parent_folders()
}

inputs = {

  use_namespaces = false

  namespace = ""

  name = "acme-api"

  allowed_read_principals = [
    "arn:aws:iam::111111111111:root", # prod
    "arn:aws:iam::222222222222:root", # dev
    "arn:aws:iam::333333333333:root", # master
    "arn:aws:iam::444444444444:root", # staging
  ]

  allowed_write_principals = [
    "arn:aws:iam::111111111111:root", # prod
    "arn:aws:iam::222222222222:root", # dev
    "arn:aws:iam::333333333333:root", # master
    "arn:aws:iam::444444444444:root", # staging
  ]

}
