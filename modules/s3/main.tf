module "labels" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace = var.namespace
  stage     = var.stage
  name      = var.name
  tags      = var.tags
}

resource "aws_s3_bucket" "this" {
  #checkov:skip=CKV_AWS_18:Access logs not required
  #checkov:skip=CKV_AWS_52:MFA delete not required
  #checkov:skip=CKV_AWS_144:cross region replication not required
  bucket = var.use_bucket_suffix_as_name ? var.bucket_name : "${module.labels.id}-${var.bucket_name}"
  tags   = module.labels.tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.bucket_versioning
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle_configuration" {
  bucket = aws_s3_bucket.this.id

  dynamic "rule" {
    for_each = var.lifecycle_rule

    content {
      id     = "${rule.key} expiry in ${rule.value} days"
      status = "Enabled"

      filter {
        prefix = rule.key
      }
      expiration {
        days = rule.value
      }
      noncurrent_version_expiration {
        noncurrent_days = 1
      }
    }
  }
  dynamic "rule" {
    for_each = var.log_expiration_days != null ? [1] : []

    content {
      id      = "log_expiration"
      status  = "Enabled"

      expiration {
        days = var.log_expiration_days
      }

      noncurrent_version_expiration {
        noncurrent_days = var.log_expiration_days
      }
    }
  }

  depends_on = [aws_s3_bucket.this]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = var.bucket_key_enabled
  }
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_policy" "this" {
  bucket     = aws_s3_bucket.this.id
  policy     = var.enforce_server_side_encryption_header ? data.aws_iam_policy_document.default.json : data.aws_iam_policy_document.no_header_policy.json
  depends_on = [aws_s3_bucket_public_access_block.this]
}

data "aws_iam_policy_document" "default" {

  source_policy_documents = [var.bucket_policy_source_json]

  statement {
    sid       = "EnforceSSL"
    effect    = "Deny"
    actions   = ["s3:*Object"]
    resources = ["${aws_s3_bucket.this.arn}/*"]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    condition {
      test     = "Bool"
      values   = ["false"]
      variable = "aws:SecureTransport"
    }
  }

  statement {
    sid    = "DenyIncorrectEncryptionHeader"
    effect = "Deny"
    actions = [
    "s3:PutObject"]
    resources = ["${aws_s3_bucket.this.arn}/*"]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    condition {
      test     = "StringNotEquals"
      values   = ["aws:kms"]
      variable = "s3:x-amz-server-side-encryption"
    }
  }

  statement {
    sid       = "DenyUnEncryptedObjectActions"
    effect    = "Deny"
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.this.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "Null"
      values   = ["true"]
      variable = "s3:x-amz-server-side-encryption"
    }
  }
  statement {
    sid       = "Allow bucket list"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.this.arn]

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
  }
}


data "aws_iam_policy_document" "no_header_policy" {

  override_policy_documents = [var.bucket_policy_source_json]

  statement {
    sid       = "EnforceSSL"
    effect    = "Deny"
    actions   = ["s3:*Object"]
    resources = ["${aws_s3_bucket.this.arn}/*"]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    condition {
      test     = "Bool"
      values   = ["false"]
      variable = "aws:SecureTransport"
    }
  }

  statement {
    sid       = "Allow bucket list"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.this.arn]

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
  }

}


resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
