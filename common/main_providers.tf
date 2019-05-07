provider "aws" {
  region              = "${var.aws_region}"
  allowed_account_ids = ["${var.aws_allowed_account_ids}"]

  version = ">= 2.0.0"

  # Make it faster by skipping something
  skip_get_ec2_platforms     = true
  skip_metadata_api_check    = true
  skip_region_validation     = true
  skip_requesting_account_id = true
}

terraform {
  backend "s3" {}
}
