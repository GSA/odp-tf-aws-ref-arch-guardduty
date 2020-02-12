variable "guardduty_bucket_name" {
  type        = string
  description = "(required) The name given to the primary logging bucket"
}

variable "guardduty_bucket_destroy" {
  type        = bool
  description = "(optional) The boolean value indicating whether Terraform can destroy the bucket with objects still inside"
  default     = false
}

variable "guardduty_access_guardduty_prefix" {
  description = "(optional) The prefix used when storing access logs for the logging bucket"
  default     = "grace-logging"
}

variable "guardduty_bucket_acl" {
  description = "(optional) The ACL applied to the primary logging bucket"
  default     = "log-delivery-write"
}

variable "guardduty_bucket_enable_versioning" {
  type        = bool
  description = "(optional) The boolean value enabling (true) or disabling (false) versioning on the logging bucket"
  default     = true
}

variable "guardduty_bucket_enable_backup" {
  type        = bool
  description = "(optional) The boolean value enabling (true) or disabling (false) backups to glacier on the logging bucket"
  default     = true
}

variable "guardduty_bucket_backup_days" {
  description = "(optional) The age of an object in number of days before it can be archived to glacier"
  default     = "365"
}

variable "guardduty_bucket_backup_expiration_days" {
  description = "(optional) The age of an object in number of days before it can be safely discarded"
  default     = "900"
}

variable "guardduty_bucket_block_public_acls" {
  type        = bool
  description = "(optional) The boolean value enabling (true) or disabling (false) the blocking of public ACL creation for the logging bucket"
  default     = true
}

variable "guardduty_bucket_ignore_public_acls" {
  type        = bool
  description = "(optional) The boolean value enabling (true) or disabling (false) the ignoring of public ACLs created for the logging bucket"
  default     = true
}

variable "guardduty_bucket_block_public_policy" {
  type        = bool
  description = "(optional) The boolean value enabling (true) or disabling (false) the blocking of public policy creation for the logging bucket"
  default     = true
}

variable "guardduty_bucket_restrict_public_buckets" {
  type        = bool
  description = "(optional) The boolean value enabling (true) or disabling (false) the blocking of public and cross-account access with the public bucket policy for the logging bucket"
  default     = true
}
