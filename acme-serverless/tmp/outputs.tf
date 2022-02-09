##################
# Lambda Function
##################
output "this_lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = module.lambda.this_lambda_function_arn
}

output "this_lambda_function_invoke_arn" {
  description = "The Invoke ARN of the Lambda Function"
  value       = module.lambda.this_lambda_function_invoke_arn
}

output "this_lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = module.lambda.this_lambda_function_name
}

output "this_lambda_function_qualified_arn" {
  description = "The ARN identifying your Lambda Function Version"
  value       = module.lambda.this_lambda_function_qualified_arn
}

output "this_lambda_function_version" {
  description = "Latest published version of Lambda Function"
  value       = module.lambda.this_lambda_function_version
}

output "this_lambda_function_last_modified" {
  description = "The date Lambda Function resource was last modified"
  value       = module.lambda.this_lambda_function_last_modified
}

output "this_lambda_function_kms_key_arn" {
  description = "The ARN for the KMS encryption key of Lambda Function"
  value       = module.lambda.this_lambda_function_kms_key_arn
}

output "this_lambda_function_source_code_hash" {
  description = "Base64-encoded representation of raw SHA-256 sum of the zip file"
  value       = module.lambda.this_lambda_function_source_code_hash
}

output "this_lambda_function_source_code_size" {
  description = "The size in bytes of the function .zip file"
  value       = module.lambda.this_lambda_function_source_code_size
}

# Lambda Layer
output "this_lambda_layer_arn" {
  description = "The ARN of the Lambda Layer with version"
  value       = module.lambda.this_lambda_layer_arn
}

output "this_lambda_layer_layer_arn" {
  description = "The ARN of the Lambda Layer without version"
  value       = module.lambda.this_lambda_layer_layer_arn
}

output "this_lambda_layer_created_date" {
  description = "The date Lambda Layer resource was created"
  value       = module.lambda.this_lambda_layer_created_date
}

output "this_lambda_layer_source_code_size" {
  description = "The size in bytes of the Lambda Layer .zip file"
  value       = module.lambda.this_lambda_layer_source_code_size
}

output "this_lambda_layer_version" {
  description = "The Lambda Layer version"
  value       = module.lambda.this_lambda_layer_version
}

# IAM Role
output "lambda_role_arn" {
  description = "The ARN of the IAM role created for the Lambda Function"
  value       = module.lambda.lambda_role_arn
}

output "lambda_role_name" {
  description = "The name of the IAM role created for the Lambda Function"
  value       = module.lambda.lambda_role_name
}

# Deployment package
output "local_filename" {
  description = "The filename of zip archive deployed (if deployment was from local)"
  value       = module.lambda.local_filename
}

output "s3_object" {
  description = "The map with S3 object data of zip archive deployed (if deployment was from S3)"
  value       = module.lambda.s3_object
}

###############
# API Gateway
###############
output "this_apigatewayv2_api_id" {
  description = "The API identifier"
  value       = module.api_gateway.this_apigatewayv2_api_id
}

output "this_apigatewayv2_api_api_endpoint" {
  description = "The URI of the API"
  value       = module.api_gateway.this_apigatewayv2_api_api_endpoint
}

output "this_apigatewayv2_api_arn" {
  description = "The ARN of the API"
  value       = module.api_gateway.this_apigatewayv2_api_arn
}

output "this_apigatewayv2_api_execution_arn" {
  description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API."
  value       = module.api_gateway.this_apigatewayv2_api_execution_arn
}

output "default_apigatewayv2_stage_execution_arn" {
  description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API."
  value       = module.api_gateway.default_apigatewayv2_stage_execution_arn
}



###############
# Lambda Alias
###############
output "this_lambda_alias_name" {
  description = "The name of the Lambda Function Alias"
  value       = module.lambda_alias.this_lambda_alias_name
}

output "this_lambda_alias_arn" {
  description = "The ARN of the Lambda Function Alias"
  value       = module.lambda_alias.this_lambda_alias_arn
}

output "this_lambda_alias_invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway"
  value       = module.lambda_alias.this_lambda_alias_invoke_arn
}

output "this_lambda_alias_description" {
  description = "Description of alias"
  value       = module.lambda_alias.this_lambda_alias_description
}

output "this_lambda_alias_function_version" {
  description = "Lambda function version which the alias uses"
  value       = module.lambda_alias.this_lambda_alias_function_version
}
