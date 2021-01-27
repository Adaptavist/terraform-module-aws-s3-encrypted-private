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