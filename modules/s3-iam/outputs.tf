output "admin_policy_arn" {
  value = aws_iam_policy.bucket_admin.arn
}

output "read_policy_arn" {
  value = aws_iam_policy.bucket_read.arn
}

output "write_policy_arn" {
  value = aws_iam_policy.bucket_write.arn
}

output "console_access_policy_arn" {
  value = aws_iam_policy.console_access.arn
}