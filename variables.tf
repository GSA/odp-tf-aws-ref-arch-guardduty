variable "guardduty_logging_bucket_name" {
  type        = string
  description = "(required) The name given to the primary logging bucket"
}

variable "guardduty_logging_prefix" {
  type    = string
  default = "odp-guardduty"
}