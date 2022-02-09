provider "aws" {
  region = "eu-west-1"

  # Make it faster by skipping something
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true

  # skip_requesting_account_id should be disabled to generate valid ARN in apigatewayv2_api_execution_arn
  skip_requesting_account_id = false
}

//provider "aws" {
//  region                      = "eu-west-1"
//  skip_credentials_validation = true
//  skip_metadata_api_check     = true
//
//  # Some services, like HTTP API Gateway, are only available in Pro-version - https://localstack.cloud/#pricing
//  endpoints {
//    apigateway     = "http://localhost:4566"
//    dynamodb       = "http://localhost:4566"
//    iam            = "http://localhost:4566"
//    lambda         = "http://localhost:4566"
//    s3             = "http://localhost:4566"
//  }
//}

resource "random_pet" "this" {
  length = 2
}

# Put all extra resources which don't belong anywhere
resource "aws_codedeploy_app" "this" {
  name             = random_pet.this.id
  compute_platform = "Lambda"
}
