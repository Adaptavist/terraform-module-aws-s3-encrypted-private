module "labels" {
  source    = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.4.0"
  namespace = var.namespace
  stage     = var.stage
  name      = var.name
  tags      = var.tags
}

resource "aws_s3_bucket" "this" {
  bucket = "${module.labels.id}-${var.bucket_name}"
  acl    = "private"
  region = var.bucket_region
  tags   = module.labels.tags

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Bucket-policy-${aws_s3_bucket.this.id}",
  "Statement": [
    {
      "Sid": "EnforceSSL",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*Object",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.this.id}/*",
      "Condition": {
         "Bool": {
            "aws:SecureTransport": false
        }
      }
    },
    {
      "Sid": "DenyIncorrectEncryptionHeader",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*Object",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.this.id}/*",
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "aws:kms"
        }
      }
    },
    {
      "Sid": "DenyUnEncryptedObjectActions",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*Object",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.this.id}/*",
      "Condition": {
        "Null": {
          "s3:x-amz-server-side-encryption": "true"
        }
      }
    }
  ]
}
POLICY

  depends_on = [aws_s3_bucket_public_access_block.this]
}


resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}