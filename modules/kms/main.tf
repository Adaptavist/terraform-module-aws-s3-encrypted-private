
module "labels" {
  source  = "cloudposse/label/terraform"
  version = "0.5.1"

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

  statement {
    sid    = "Allow access for Key Administrators"
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

  dynamic "statement" {
    for_each = length(var.user_role_arns) == 0 ? [] : [true]
    content {
      sid    = "Allow use of the key for encryption"
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