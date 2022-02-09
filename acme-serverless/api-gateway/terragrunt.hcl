terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-apigateway-v2.git?ref=master"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../lambda"]
}

dependency "lambda" {
  config_path = "../lambda"
#  skip_outputs = true
}

inputs = {
  name          = "awesome-api-gateway"
  description   = "My awesome HTTP API Gateway"
  protocol_type = "HTTP"

  create_api_domain_name = false

  default_stage_access_log_destination_arn = "arn:aws:logs:eu-west-1:835367859851:log-group:debug-apigateway"
  default_stage_access_log_format          = "$context.identity.sourceIp - - [$context.requestTime] \"$context.httpMethod $context.routeKey $context.protocol\" $context.status $context.responseLength $context.requestId $context.integrationErrorMessage"

  integrations = {
    "GET /" = {
      lambda_arn             = dependency.lambda.outputs.this_lambda_function_arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }

    "$default" = {
      lambda_arn = dependency.lambda.outputs.this_lambda_function_arn
    }

  }

}
