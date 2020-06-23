// labels

variable "namespace" {
  default = ""
}
variable "name" {
  default = "S3-KMS"
}
variable "tags" {
  type    = map(string)
  default = {}
}

variable "stage" {
  default = ""
}

// bucket

variable "bucket_suffix" {
  type        = string
  description = "Name of the bucket to be created"
}

variable "bucket_region" {
  type = string
}

variable "kms_user_role_arns" {
  description = "List of IAM Role ARNs that will be allowed to use the key"
  type        = list(string)
  default     = []
}

variable "kms_admin_role_arns" {
  type        = list(string)
  description = "List of IAM Role ARNs that will be allowed to administer the key"
}