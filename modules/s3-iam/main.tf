// Policy documents

data "aws_iam_policy_document" "bucket_admin" {
  statement {
    sid    = "FullAccess"
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    actions = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "bucket_read" {
  statement {
    sid    = "ListAccess"
    effect = "Allow"
    resources = [
      "*"
    ]
    actions = [
      "s3:ListBucket",
      "s3:HeadBucket"
    ]
  }
  statement {
    sid    = "ReadAccess"
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    actions = [
      "s3:GetObject*"
    ]
  }
  statement {
    sid    = "DecryptAccess"
    effect = "Allow"
    resources = [
      var.kms_key_arn
    ]
    actions = [
      "kms:Decrypt"
    ]
  }
}

data "aws_iam_policy_document" "bucket_write" {
  statement {
    sid    = "ListAccess"
    effect = "Allow"
    resources = [
      "*"
    ]
    actions = [
      "s3:ListBucket",
      "s3:HeadBucket"
    ]
  }
  statement {
    sid    = "WriteAccess"
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket_name}/*",
      "arn:aws:s3:::${var.bucket_name}"
    ]
    actions = [
      "s3:DeleteObject*",
      "s3:PutObject*",
      "s3:GetObject",
      "s3:RestoreObject"
    ]
  }
  statement {
    sid    = "EncryptAccess"
    effect = "Allow"
    resources = [
      var.kms_key_arn
    ]
    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:GenerateDataKey"
    ]
  }
}

data "aws_iam_policy_document" "console_access" {
  statement {
    sid    = "ListAccess"
    effect = "Allow"
    resources = [
      "*"
    ]
    actions = [
      "s3:ListBucket",
      "s3:HeadBucket",
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets"
    ]
  }
  statement {
    sid    = "WriteAccess"
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    actions = [
      "s3:PutObject*",
      "s3:GetObject*",
      "s3:GetBucket*",
      "s3:DeleteObject*"
    ]
  }
  statement {
    sid    = "DecryptAccess"
    effect = "Allow"
    resources = [
      var.kms_key_arn
    ]
    actions = [
      "kms:Decrypt",
      "kms:Encrypt"
    ]
  }
}

// IAM Policies

resource "aws_iam_policy" "bucket_admin" {
  name        = "${var.bucket_name}-Admin"
  description = "Provides admin access for ${var.bucket_name} bucket"
  policy      = data.aws_iam_policy_document.bucket_admin.json
}

resource "aws_iam_policy" "bucket_read" {
  name        = "${var.bucket_name}-Read"
  description = "Provides read access for ${var.bucket_name} bucket"
  policy      = data.aws_iam_policy_document.bucket_read.json
}

resource "aws_iam_policy" "bucket_write" {
  name        = "${var.bucket_name}-Write"
  description = "Provides write access for ${var.bucket_name} bucket"
  policy      = data.aws_iam_policy_document.bucket_write.json
}

resource "aws_iam_policy" "console_access" {
  name        = "${var.bucket_name}-ConsoleAccess"
  description = "Provides console access for ${var.bucket_name} bucket"
  policy      = data.aws_iam_policy_document.console_access.json
}
