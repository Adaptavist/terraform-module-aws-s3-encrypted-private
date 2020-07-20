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
      "arn:aws:s3:::${var.bucket_name}"
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
      "s3:ListObject*",
      "s3:GetObject*"
    ]
  }
}

data "aws_iam_policy_document" "bucket_write" {
  statement {
    sid    = "ListAccess"
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket_name}"
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
      "s3:ListObject*",
      "s3:GetObject",
      "s3:RestoreObject"
    ]
  }
}

data "aws_iam_policy_document" "console_access" {
  statement {
    sid    = "ListBuckets"
    effect = "Allow"
    resources = [
      "*"
    ]
    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets"
    ]
  }
  statement {
    sid    = "ListAccess"
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket_name}"
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
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    actions = [
      "s3:PutObject*",
      "s3:GetObject*",
      "s3:ListObject*",
      "s3:GetBucket*",
      "s3:DeleteObject*"
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
