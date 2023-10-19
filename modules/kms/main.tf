module "labels" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  namespace = var.namespace
  stage     = var.stage
  name      = var.name
  tags      = var.tags
}

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "this" {
  tags                = module.labels.tags
  description         = var.description
  enable_key_rotation = var.enable_key_rotation
  policy              = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "this" {
  #checkov:skip=CKV_AWS_111:resource not known at this point
  #checkov:skip=CKV_AWS_109:resource not known at this point
  source_policy_documents = [var.kms_policy_source_json]
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions = [
      "kms:*",
    ]
    resources = ["*"]
  }

  dynamic "statement" {
    for_each = length(var.admin_role_arns) == 0 ? [] : [true]
    content {
      sid    = "Allow user role Administrator access"
      effect = "Allow"
      principals {
        type        = "AWS"
        identifiers = var.admin_role_arns
      }
      actions = [
        "kms:Create*",
        "kms:Describe*",
        "kms:Enable*",
        "kms:List*",
        "kms:Put*",
        "kms:Update*",
        "kms:Revoke*",
        "kms:Disable*",
        "kms:Get*",
        "kms:Delete*",
        "kms:TagResource",
        "kms:UntagResource",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion"
      ]
      resources = ["*"]
    }
  }

  dynamic "statement" {
    for_each = length(var.user_role_arns) == 0 ? [] : [true]
    content {
      sid    = "Allow use of the key for encryption by user roles"
      effect = "Allow"
      principals {
        type        = "AWS"
        identifiers = var.user_role_arns
      }
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ]
      resources = ["*"]
    }
  }

  dynamic "statement" {
    for_each = length(var.admin_services) == 0 ? [] : [true]
    content {
      sid    = "Allow service Administrator access to key"
      effect = "Allow"
      principals {
        type        = "Service"
        identifiers = var.admin_services
      }
      actions = [
        "kms:Create*",
        "kms:Describe*",
        "kms:Enable*",
        "kms:List*",
        "kms:Put*",
        "kms:Update*",
        "kms:Revoke*",
        "kms:Disable*",
        "kms:Get*",
        "kms:Delete*",
        "kms:TagResource",
        "kms:UntagResource",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion"
      ]
      resources = ["*"]
    }
  }

  dynamic "statement" {
    for_each = length(var.user_services) == 0 ? [] : [true]
    content {
      sid    = "Allow use of the key for encryption by services"
      effect = "Allow"
      principals {
        type        = "Service"
        identifiers = var.user_services
      }
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ]
      resources = ["*"]
    }
  }

  dynamic "statement" {
    for_each = length(var.user_role_arns) == 0 ? [] : [true] // both
    content {
      sid    = "Allow attachment of persistent resources"
      effect = "Allow"
      principals {
        type        = "AWS"
        identifiers = var.user_role_arns
      }
      actions = [
        "kms:CreateGrant",
        "kms:ListGrants",
        "kms:RevokeGrant"
      ]
      resources = ["*"]
      condition {
        test     = "Bool"
        variable = "kms:GrantIsForAWSResource"
        values   = ["true"]
      }
    }
  }
}

resource "aws_kms_alias" "this" {
  name          = "alias/${module.labels.id}-${var.key_alias}"
  target_key_id = aws_kms_key.this.id
}
