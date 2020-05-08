# organizations

This module describes all AWS Organizations resources as-is. Most of this code has been imported from already created resources (before this project started).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| feature\_set | Specify 'ALL' (default) or 'CONSOLIDATED\_BILLING'. | `string` | `"ALL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| acme\_prod\_organizations\_account\_arn | The ARN for this account |
| acme\_prod\_organizations\_account\_id | The AWS account id |
| acme\_staging\_organizations\_account\_arn | The ARN for this account |
| acme\_staging\_organizations\_account\_id | The AWS account id |
| this\_organizations\_organization\_arn | ARN of the organization |
| this\_organizations\_organization\_id | Identifier of the organization |
| this\_organizations\_organization\_master\_account\_arn | ARN of the master account |
| this\_organizations\_organization\_master\_account\_email | Email address of the master account |
| this\_organizations\_organization\_master\_account\_id | Identifier of the master account |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
