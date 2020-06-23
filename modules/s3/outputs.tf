output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "bucket_name" {
  value = "${module.labels.id}-${var.bucket_name}"
}