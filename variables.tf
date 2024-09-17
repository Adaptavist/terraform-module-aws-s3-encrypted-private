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

variable "kms_user_role_arns" {
  description = "List of IAM Role ARNs that will be allowed to use the key"
  type        = list(string)
  default     = []
}

variable "kms_admin_role_arns" {
  type        = list(string)
  description = "List of IAM Role ARNs that will be allowed to administer the key"
  default     = []
}

variable "kms_user_services" {
  description = "List of AWS services that will be allowed to use the key for decryption"
  type        = list
  default     = []
}

variable "kms_admin_services" {
  type        = list
  description = "List of AWS services that will be allowed to administer the key"
  default     = []
}

variable "use_bucket_suffix_as_name" {
  type        = bool
  default     = false
  description = "Indicates if labels module should not be used to generate the bucket name"
}

variable "enforce_server_side_encryption_header" {
  type        = bool
  default     = true
  description = "Enforce clients to send s3:x-amz-server-side-encryption header."
}

variable "bucket_policy_source_json" {
  type        = string
  default     = ""
  description = "Base bucket policy document."
}

variable "kms_policy_source_json" {
  type        = string
  default     = ""
  description = "Base kms policy document."
}

variable "bucket_key_enabled" {
  type        = bool
  default     = true
  description = "Enable S3 bucket key (used to reduce KMS costs)"
}

variable "lifecycle_rule" {
  description = "Bucket lifecycle prefix and expiry date."
  type = map(number)
  default = {}
}

variable "log_expiration_days" {
  description = "The number of days after which the object in the bucket expires"
  type        = number
  default     = null
}

variable "bucket_versioning" {
  description = "Bucket versioning configuration."
  type        = string
  default     = "Enabled"

  validation {
    condition     = contains(["Enabled", "Suspended", "Disabled"], var.bucket_versioning)
    error_message = "bucket_versioning must be one of the following: Enabled, Suspended or Disabled."
  }
}

variable "should_force_destroy" {
  description = "Whether to force destroy the S3 bucket contents when the bucket is destroyed."
  type        = bool
  default     = false
}
