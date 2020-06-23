output "bucket_arn" {
  value       = module.this.bucket_arn
  description = "ARN of the created bucket"
}

output "bucket_name" {
  value       = module.this.bucket_name
  description = "Name of the created bucket"
}

output "kms_key_arn" {
  value       = module.this.kms_key_arn
  description = "ARN of the CMK KMS key used for encryption S3 bucket data at rest"
}

output "kms_key_alias_arn" {
  value       = module.this.kms_key_alias_arn
  description = "ARN of the CMK KMS key alias"
}

output "kms_key_alias_name" {
  value       = module.this.kms_key_alias_name
  description = "Name of the CMK KMS key alias"
}

output "s3_write_policy_arn" {
  value       = module.this.s3_write_policy_arn
  description = "ARN of the IAM policy that provides write access to the created S3 bucket"
}

output "s3_read_policy_arn" {
  value       = module.this.s3_read_policy_arn
  description = "ARN of the IAM policy that provides read access to the created S3 bucket"
}

output "s3_admin_policy_arn" {
  value       = module.this.s3_admin_policy_arn
  description = "ARN of the IAM policy that provides admin access to the created S3 bucket"
}

output "testing_role_arn" {
  value       = aws_iam_role.this.arn
  description = "IAM Role ARN to be used for testing"
}

output "unauthorised_testing_role_arn" {
  value       = aws_iam_role.unauthorised.arn
  description = "Unauthorised IAM Role ARN to be used for testing"
}

