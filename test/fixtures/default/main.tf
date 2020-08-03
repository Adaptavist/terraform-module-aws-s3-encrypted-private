terraform {
  required_version = "~> 0.12.0"

  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "labels" {
  source  = "cloudposse/label/terraform"
  version = "0.4.0"

  namespace = "adaptavist-test"
  stage     = "stg"
  name      = "test"
  tags = {
    Product      = "test"
    BusinessUnit = "test"
    Component    = "test"
  }

}
data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = "test-role-${var.bucket_suffix}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags               = module.labels.tags
}

resource "aws_iam_role" "unauthorised" {
  name               = "test-role-unauthorised-${var.bucket_suffix}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags               = module.labels.tags
}

module "this" {
  source              = "../../.."
  namespace           = module.labels.namespace
  stage               = module.labels.stage
  tags                = module.labels.tags
  bucket_suffix       = var.bucket_suffix
  kms_admin_role_arns = [data.aws_caller_identity.current.arn]
  kms_user_role_arns  = [aws_iam_role.this.arn]
}

resource "aws_iam_role_policy_attachment" "allow_bucket_write" {
  role       = aws_iam_role.this.name
  policy_arn = module.this.s3_write_policy_arn
}


