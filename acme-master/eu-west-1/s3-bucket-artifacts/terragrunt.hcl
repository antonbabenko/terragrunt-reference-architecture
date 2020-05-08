terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-s3-bucket.git?ref=v1.6.0"
}

include {
  path = find_in_parent_folders()
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/1.6.0?tab=inputs
###########################################################
inputs = {

  bucket              = "main-bucket"
  acl                 = "private"
  force_destroy       = true
  block_public_policy = true

  cors_rule = {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    allowed_headers = ["*"]
    max_age_seconds = 3000
  }

  lifecycle_rule = [
    {
      id      = "delete-all-ancient"
      enabled = true

      expiration = {
        days = 365
      }
    }
  ]

}
