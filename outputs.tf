output "bucket_arn" {
  value       = module.s3.bucket_arn
  description = "ARN of the created bucket"
}

output "bucket_name" {
  value       = module.s3.bucket_name
  description = "Name of the created bucket"
}

output "kms_key_arn" {
  value       = module.kms.key_arn
  description = "ARN of the CMK KMS key used for encryption S3 bucket data at rest"
}

output "kms_key_id" {
  value       = module.kms.key_id
  description = "Key id of the CMK KMS key used for encryption S3 bucket data at rest"
}

output "kms_key_alias_arn" {
  value       = module.kms.alias_arn
  description = "ARN of the CMK KMS key alias"
}

output "kms_key_alias_name" {
  value       = module.kms.alias_name
  description = "Name of the CMK KMS key alias"
}

output "s3_write_policy_arn" {
  value       = module.s3-iam-roles.write_policy_arn
  description = "ARN of the IAM role that provides write access to the created S3 bucket"
}

output "s3_read_policy_arn" {
  value       = module.s3-iam-roles.read_policy_arn
  description = "ARN of the IAM role that provides read access to the created S3 bucket"
}

output "s3_admin_policy_arn" {
  value       = module.s3-iam-roles.admin_policy_arn
  description = "ARN of the IAM role that provides admin access to the created S3 bucket"
}

output "s3_console_access_policy_arn" {
  value       = module.s3-iam-roles.console_access_policy_arn
  description = "ARN of the IAM role that provides console access to the created S3 bucket"
}


