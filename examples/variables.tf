variable "guardduty_bucket_name" {
  type        = string
  description = "The name given to the primary logging bucket"
  default = "odp-guardduty-xxxxxxxx-bucket"
}

variable "guardduty_bucket_acl" {
  description = "The ACL applied to the primary logging bucket"
  default     = "log-delivery-write"
}

variable "guardduty_bucket_destroy" {
  type        = bool
  description = "The boolean value indicating whether Terraform can destroy the bucket with objects still inside"
  default     = false
}

variable "guardduty_bucket_enable_versioning" {
  type        = bool
  description = "The boolean value enabling (true) or disabling (false) versioning on the logging bucket"
  default     = true
}

variable "guardduty_bucket_block_public_acls" {
  type        = bool
  description = "The boolean value enabling (true) or disabling (false) the blocking of public ACL creation for the logging bucket"
  default     = true
}

variable "guardduty_bucket_ignore_public_acls" {
  type        = bool
  description = "The boolean value enabling (true) or disabling (false) the ignoring of public ACLs created for the logging bucket"
  default     = true
}

variable "guardduty_bucket_block_public_policy" {
  type        = bool
  description = "The boolean value enabling (true) or disabling (false) the blocking of public policy creation for the logging bucket"
  default     = true
}

variable "guardduty_bucket_restrict_public_buckets" {
  type        = bool
  description = "The boolean value enabling (true) or disabling (false) the blocking of public and cross-account access with the public bucket policy for the logging bucket"
  default     = true
}
