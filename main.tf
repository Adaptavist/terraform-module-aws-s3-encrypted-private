module "labels" {
  source  = "cloudposse/label/terraform"
  version = "0.8.0"

  namespace = var.namespace
  stage     = var.stage
  name      = var.name
  tags      = var.tags
}

module "kms" {
  source              = "./modules/kms"
  namespace           = var.namespace
  stage               = var.stage
  name                = var.name
  tags                = var.tags
  description         = "${module.labels.id}-${var.bucket_suffix}-CMK"
  key_alias           = "${module.labels.id}-${var.bucket_suffix}-CMK"
  enable_key_rotation = "true"
  admin_role_arns     = var.kms_admin_role_arns
  user_role_arns      = var.kms_user_role_arns
}

module "s3" {
  source                                = "./modules/s3"
  namespace                             = var.namespace
  stage                                 = var.stage
  name                                  = var.name
  tags                                  = var.tags
  bucket_name                           = var.bucket_suffix
  kms_key_arn                           = module.kms.key_arn
  use_bucket_suffix_as_name             = var.use_bucket_suffix_as_name
  enforce_server_side_encryption_header = var.enforce_server_side_encryption_header
}

module "s3-iam-roles" {
  source      = "./modules/s3-iam"
  bucket_name = module.s3.bucket_name
  kms_key_arn = module.kms.key_arn
}