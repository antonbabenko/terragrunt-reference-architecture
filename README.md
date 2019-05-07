# Acme's Infrastructure - Terragrunt Reference Architecture

This repository contains rather complete infrastructure configurations where [Terragrunt](https://github.com/gruntwork-io/terragrunt) is used to manage infrastructure for [Acme Corporation](https://en.wikipedia.org/wiki/Acme_Corporation).

### By the way!

This code is very close to the one produced by [modules.tf](https://modules.tf/) - [open-source](https://github.com/antonbabenko/modules.tf-lambda) infrastructure as code generator from visual diagrams created with [Cloudcraft.co](https://cloudcraft.co/app). 

## Introduction

Acme has several environments (prod, staging and dev) entirely separated by AWS accounts.

Infrastructure in each environment consists of multiple layers (autoscaling, alb, vpc, ...) where each layer is configured using one of [Terraform AWS modules](https://github.com/terraform-aws-modules/) with arguments specified in `terraform.tfvars` in layer's directory.

[Terragrunt](https://github.com/gruntwork-io/terragrunt) is used to work with Terraform configurations which allows to orchestrate dependent layers, update arguments dynamically and keep configurations [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).


## Environments

Primary AWS region for all environments is `eu-central-1 (Frankfurt)`:

- `acme-prod` - Production configurations (AWS account - 111111111111)
- `acme-staging` - Staging configurations (AWS account - 444444444444)
- `acme-master` - Master AWS account (333333333333) contains:

  - AWS Organizations
  - IAM entities (users, groups)
  - ECR repositories
  - Route53 zones

  
## Pre-requirements

- [Terraform 0.11](https://github.com/hashicorp/terraform)
- [Terragrunt 0.18 or newer](https://github.com/gruntwork-io/terragrunt)
- [Terraform Docs](https://github.com/segmentio/terraform-docs)
- [pre-commit hooks](http://pre-commit.com) to keep Terraform formatting and documentation up-to-date
- [tfvars-annotations](https://github.com/antonbabenko/tfvars-annotations) to process & update annotations in tfvars files
- [direnv](https://github.com/direnv/direnv#setup) to automatically set correct environment variables per AWS account as specified in `.envrc` (optional)

If you are using Mac you can install all dependencies using Homebrew:

    $ brew install terraform terraform-docs terragrunt pre-commit direnv
    $ brew install https://raw.githubusercontent.com/antonbabenko/tfvars-annotations/master/HomebrewFormula/tfvars-annotations.rb

## AWS accounts and IAM relations

Acme has dedicated AWS account where IAM users, groups and roles are managed. This AWS account is used as a jump account, where IAM users are logged in and then they assume role in other AWS account.

AWS access credentials should be set using environment variables:

    $ export AWS_DEFAULT_REGION=eu-central-1
    $ export AWS_ACCESS_KEY_ID=...
    $ export AWS_SECRET_ACCESS_KEY=...

[aws-vault](https://github.com/99designs/aws-vault), [vaulted](https://github.com/miquella/vaulted) or other tool can be used to manage your AWS credentials securely locally and switch roles.


## How to use it?

Go to directory for the environment and region you want to work with:

    $ cd acme-staging/eu-central-1
    
Initialize the dependencies (download providers and modules). This command is enough to run once:

    $ terragrunt init

To create infrastructure in all layers in a single region:

    $ terragrunt apply-all

Alternatively, you can create infrastructure in a single layer (eg, `vpc`):

    $ cd vpc
    $ terragrunt apply

See [official Terragrunt documentation](https://github.com/gruntwork-io/terragrunt/blob/master/README.md) for all available commands and features.


## Authors

This project is created and maintained by [Anton Babenko](https://github.com/antonbabenko).

[![Maintained by Anton Babenko](https://img.shields.io/badge/maintained%20by-@antonbabenko-%235c4ee5.svg)](https://github.com/antonbabenko) [![@antonbabenko](https://img.shields.io/twitter/follow/antonbabenko.svg?style=social&label=Follow%20@antonbabenko%20on%20Twitter)](https://twitter.com/antonbabenko)


## License

This work is licensed under MIT License. See LICENSE for full details.

Copyright (c) 2019 Anton Babenko
