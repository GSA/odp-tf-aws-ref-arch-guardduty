variable "guardduty_logging_bucket_name" {
  type        = string
  description = "The name given to the primary logging bucket"
  default     = "odp-guardduty-xxxxxxxx-bucket"
}

variable "guardduty_logging_prefix" {
  type    = string
  default = "odp-guardduty"
}

variable "guardduty_logging_bucket_kms_arn" {
  type    = string
  default = ""
}
