// labelling

variable "name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "stage" {
  type = string
}

variable "tags" {
  type = map(string)
}

// bucket

variable "bucket_name" {
  type = string
}

variable "kms_key_arn" {
  type = string
}

variable "use_bucket_suffix_as_name" {
  type = bool
}

variable "enforce_server_side_encryption_header" {
  type = bool
}

variable "bucket_policy_source_json" {
  type = string
}

variable "bucket_key_enabled" {
  type = bool
}

variable "lifecycle_rule" {
  description = "Bucket lifecycle prefix and expiry date."
  type = map(number)
  default = {}
}
variable "log_expiration_days" {
  description = "The number of days after which the object in the bucket expires"
  type        = number
  default     = 30
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