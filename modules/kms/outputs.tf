output "key_arn" {
  value       = aws_kms_key.this.arn
  description = "Key ARN"
}

output "key_id" {
  value       = aws_kms_key.this.key_id
  description = "Key ID"
}

output "alias_arn" {
  value       = aws_kms_alias.this.arn
  description = "Alias ARN"
}

output "alias_name" {
  value       = aws_kms_alias.this.name
  description = "Alias name"
}