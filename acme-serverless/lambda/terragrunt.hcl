terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-lambda.git?ref=master"
}

include {
  path = find_in_parent_folders()
}

#
#dependencies {
#  paths = ["../api-gateway"]
#}
#
#dependency "api_gateway" {
#  config_path = "../api-gateway"
#}

locals {
  artifacts_dir = abspath("${get_terragrunt_dir()}/../builds")
}

inputs = {
  function_name = "awesome-lambda-python"
  description   = "My awesome Python lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  publish       = true

  // terragrunt bug: use jsonencode when "type = any"
  source_path = jsonencode("${get_parent_terragrunt_dir()}/src/python-function")

  artifacts_dir = local.artifacts_dir

  attach_tracing_policy    = true

  //  create_current_version_allowed_triggers = false
#  allowed_triggers = {
#    AllowExecutionFromAPIGateway = {
#      service    = "apigateway"
#      source_arn = "${dependency.api_gateway.outputs.this_apigatewayv2_api_execution_arn}/*/*"
#    }
#  }

}
