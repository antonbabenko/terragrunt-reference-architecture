# Plan for Terragrunt talk

0. Infrastructure as code == Terraform
1. Intro and use cases - https://github.com/gruntwork-io/terragrunt
2. Demo:
 - sample repos:
   - https://github.com/terraform-aws-modules/meta
   - https://github.com/antonbabenko/terragrunt-reference-architecture
   - https://github.com/antonbabenko/modules.tf-demo
 - code structure
   - group by logical provider's mental model (AWS = account/region/env/proj)
   - group by working area (eg, all AWS Lambda functions inside "lambdas" folder)
   - service-provider oriented VS application-oriented approach
   
 - IAM roles (direnv)
 - Terragrunt hooks ( https://github.com/terraform-aws-modules/meta/blob/master/github/terragrunt.hcl#L6 )
 - dependencies
 - dependency
 - apply-all, plan-all, validate-all
 - atlantis / makefile
 - pre-commit, terraform-docs
 - patterns:
   - include files (hierarchy, internal (specific) + high-level (general))
   - modules (local => PR to origin => external repo)
   - extend Terragrunt with Terraform (workaround for passing providers or other limits, terraform does not support CLI for providers, for eg)
   - use module placeholder to get remote_state benefits
   - tfvars = static, but `inputs` in terragrunt.hcl has full support for expressions and functions
   - `depends_on` with modules = native `dependency` output with TG
 - complains & limitations:
   - verbosity in outputs
   - multiple providers (possible, but hard)
   - for_each with modules
   - circular dependencies between modules (eg, AWS Lambda + API Gateway + Permissions)
   - lots of various issues and bugs when doing complex things
   - terragrunt state 
3. modules.tf
