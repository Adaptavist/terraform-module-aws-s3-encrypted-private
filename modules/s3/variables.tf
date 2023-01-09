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