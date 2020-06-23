module "labels" {
  source    = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.4.0"
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
  source        = "./modules/s3"
  namespace     = var.namespace
  stage         = var.stage
  name          = var.name
  tags          = var.tags
  bucket_name   = var.bucket_suffix
  bucket_region = var.bucket_region
  kms_key_arn   = module.kms.key_arn
}

module "s3-iam-roles" {
  source      = "./modules/s3-iam"
  bucket_name = module.s3.bucket_name
}







