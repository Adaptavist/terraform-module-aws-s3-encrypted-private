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

// KMS

variable "enable_key_rotation" {
  type    = string
  default = "false"
}
variable "description" {
  type = string
}
variable "key_alias" {
  type = string
}

variable "user_role_arns" {
  description = "List of IAM Role ARNs that will be allowed to use the key for decryption"
  type        = list
  default     = []
}

variable "admin_role_arns" {
  type        = list
  description = "List of IAM Role ARNs that will be allowed to administer the key"
  default     = []
}

variable "user_services" {
  description = "List of AWS services that will be allowed to use the key for decryption"
  type        = list
  default     = []
}

variable "admin_services" {
  type        = list
  description = "List of AWS services that will be allowed to administer the key"
  default     = []
}
