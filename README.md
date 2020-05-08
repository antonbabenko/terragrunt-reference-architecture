# Acme's Infrastructure - Terragrunt Reference Architecture (updated: May 2020)

This repository contains rather complete infrastructure configurations where [Terragrunt](https://github.com/gruntwork-io/terragrunt) is used to manage infrastructure for [Acme Corporation](https://en.wikipedia.org/wiki/Acme_Corporation).


### By the way!

This code is very close to the one produced by [modules.tf](https://modules.tf/) - [open-source](https://github.com/antonbabenko/modules.tf-lambda) infrastructure as code generator from visual diagrams created with [Cloudcraft.co](https://cloudcraft.co/app). See it yourself in [modules.tf-demo](https://github.com/antonbabenko/modules.tf-demo)!


## Introduction

Acme has several environments (prod, staging and dev) entirely separated by AWS accounts.

Infrastructure in each environment consists of multiple layers (autoscaling, alb, vpc, ...) where each layer is configured using one of [Terraform AWS modules](https://github.com/terraform-aws-modules/) with arguments specified in `terragrunt.hcl` in layer's directory.

[Terragrunt](https://github.com/gruntwork-io/terragrunt) is used to work with Terraform configurations which allows orchestrating of dependent layers, update arguments dynamically and keep configurations [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).


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

- [Terraform 0.12](https://www.terraform.io/intro/getting-started/install.html)
- [Terragrunt 0.22 or newer](https://terragrunt.gruntwork.io/docs/getting-started/install/)
- [Terraform Docs](https://github.com/segmentio/terraform-docs)
- [pre-commit hooks](http://pre-commit.com) to keep Terraform formatting and documentation up-to-date
- [direnv](https://github.com/direnv/direnv#setup) to automatically set correct environment variables per AWS account as specified in `.envrc` (optional)

If you are using macOS you can install all dependencies using [Homebrew](https://brew.sh/):

    $ brew install terraform terragrunt pre-commit


## Configure access to AWS account

Acme has dedicated AWS account where IAM users, groups and roles managed. This AWS account is a jump account, where IAM users logged in, and then they assume role in other AWS account.

The recommended way to configure access credentials to AWS account is using environment variables:

```
$ export AWS_DEFAULT_REGION=eu-west-1
$ export AWS_ACCESS_KEY_ID=...
$ export AWS_SECRET_ACCESS_KEY=...
```

Alternatively, you can edit `terragrunt.hcl` and use another authentication mechanism as described in [AWS provider documentation](https://www.terraform.io/docs/providers/aws/index.html#authentication).


[aws-vault](https://github.com/99designs/aws-vault), [vaulted](https://github.com/miquella/vaulted), [awsp](https://github.com/antonbabenko/awsp) or other tool can be used to manage your AWS credentials securely locally and switch roles.


## Create and manage your infrastructure

Infrastructure consists of multiple layers (vpc, alb, ...) where each layer is described using one [Terraform module](https://www.terraform.io/docs/configuration/modules.html) with `inputs` arguments specified in `terragrunt.hcl` in respective layer's directory.

Navigate through layers to review and customize values inside `inputs` block.

There are two ways to manage infrastructure (slower&complete, or faster&granular):
- **Region as a whole (slower&complete).** Run this command to create infrastructure in all layers in a single region:

```
$ cd acme-prod/eu-central-1
$ terragrunt apply-all
```

- **As a single layer (faster&granular).** Run this command to create infrastructure in a single layer (eg, `vpc`):

```
$ cd acme-prod/eu-central-1/vpc
$ terragrunt apply
```

After you confirm the creation of the infrastructure should succeed.

If you want to suppress irrelevant output produced by Terragrunt, you can install this alias in your shell ([source to gist](https://gist.github.com/antonbabenko/675049186e54b770b4789886d2056639)):

    terragrunt () {
    	local action=$1
    	shift 1
    	command terragrunt $action "$@" 2>&1 | sed -E "s|$(dirname $(pwd))/||g;s|^\[terragrunt\]( [0-9]{4}/[0-9]{2}/[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})* ||g;s|(\[.*\]) [0-9]{4}/[0-9]{2}/[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}|\1|g"
    }


## References

* [Terraform documentation](https://www.terraform.io/docs/) and [Terragrunt documentation](https://terragrunt.gruntwork.io/docs/) for all available commands and features.
* [Terraform AWS modules](https://github.com/terraform-aws-modules/).
* [Terraform modules registry](https://registry.terraform.io/).


## Author

This project is created and maintained by [Anton Babenko](https://github.com/antonbabenko).

[![Maintained by Anton Babenko](https://img.shields.io/badge/maintained%20by-@antonbabenko-%235c4ee5.svg)](https://github.com/antonbabenko) [![@antonbabenko](https://img.shields.io/twitter/follow/antonbabenko.svg?style=social&label=Follow%20@antonbabenko%20on%20Twitter)](https://twitter.com/antonbabenko)


## License

All content, including [Terraform AWS modules](https://github.com/terraform-aws-modules/) used in these configurations, is released under the MIT License.

Copyright (c) 2019-2020 Anton Babenko
