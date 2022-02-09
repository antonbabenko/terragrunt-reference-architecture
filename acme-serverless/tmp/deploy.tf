//module "deploy" {
//  source  = "terraform-aws-modules/lambda/aws//modules/deploy"
//  version = "~> 1.0"
//
//  alias_name    = module.lambda_alias.this_lambda_alias_name
//  function_name = module.lambda.this_lambda_function_name
//
//  target_version = module.lambda.this_lambda_function_version
//  description    = "This is my awesome deploy!"
//
//  use_existing_app = true
//  app_name         = aws_codedeploy_app.this.name
//
//  create_deployment_group = true
//  deployment_group_name   = "prod"
//
////  deployment_config_name = "CodeDeployDefault.LambdaCanary10Percent5Minutes"
//
//  create_deployment          = true
//  wait_deployment_completion = true
//  //  force_deploy               = true
//}
