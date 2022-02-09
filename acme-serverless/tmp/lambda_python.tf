module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 1.0"

  function_name = "${random_pet.this.id}-lambda-python"
  description   = "My awesome Python lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  publish       = true

  source_path = "../src/python-function"

  attach_tracing_policy    = true
  attach_policy_statements = true

  policy_statements = {
    s3_read = {
      effect    = "Allow",
      actions   = ["s3:HeadObject", "s3:GetObject"],
      resources = ["${module.s3_bucket.this_s3_bucket_arn}/*"]
    }
  }

//  create_current_version_allowed_triggers = false
  allowed_triggers = {
    AllowExecutionFromAPIGateway = {
      service    = "apigateway"
      source_arn = "${module.api_gateway.this_apigatewayv2_api_execution_arn}/*/*"
    }
  }
}

module "lambda_alias" {
  source  = "terraform-aws-modules/lambda/aws//modules/alias"
  version = "~> 1.0"

  name = "prod"

  function_name = module.lambda.this_lambda_function_name

  # Set function_version when creating alias to be able to deploy using it,
  # because AWS CodeDeploy doesn't understand $LATEST as CurrentVersion.
  function_version = module.lambda.this_lambda_function_version
}
