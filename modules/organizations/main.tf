variable "feature_set" {
  description = "Specify 'ALL' (default) or 'CONSOLIDATED_BILLING'."
  default     = "ALL"
}

resource "aws_organizations_organization" "this" {
  feature_set = var.feature_set
}

output "this_organizations_organization_id" {
  description = "Identifier of the organization"
  value       = aws_organizations_organization.this.id
}

output "this_organizations_organization_arn" {
  description = "ARN of the organization"
  value       = aws_organizations_organization.this.arn
}

output "this_organizations_organization_master_account_arn" {
  description = "ARN of the master account"
  value       = aws_organizations_organization.this.master_account_arn
}

output "this_organizations_organization_master_account_email" {
  description = "Email address of the master account"
  value       = aws_organizations_organization.this.master_account_email
}

output "this_organizations_organization_master_account_id" {
  description = "Identifier of the master account"
  value       = aws_organizations_organization.this.master_account_id
}

// acme-prod
resource "aws_organizations_account" "acme_prod" {
  name                       = "acme-prod"
  email                      = "anton+acme-prod@antonbabenko.com"
  iam_user_access_to_billing = "ALLOW"
  role_name                  = "admin"
}

output "acme_prod_organizations_account_id" {
  description = "The AWS account id"
  value       = aws_organizations_account.acme_prod.id
}

output "acme_prod_organizations_account_arn" {
  description = "The ARN for this account"
  value       = aws_organizations_account.acme_prod.arn
}

// acme-staging
resource "aws_organizations_account" "acme_staging" {
  name                       = "acme-staging"
  email                      = "anton+acme-prod@antonbabenko.com"
  iam_user_access_to_billing = "ALLOW"
  role_name                  = "admin"
}

output "acme_staging_organizations_account_id" {
  description = "The AWS account id"
  value       = aws_organizations_account.acme_staging.id
}

output "acme_staging_organizations_account_arn" {
  description = "The ARN for this account"
  value       = aws_organizations_account.acme_staging.arn
}
