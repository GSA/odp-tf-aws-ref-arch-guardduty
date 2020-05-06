provider "aws" {
  region = "us-east-1"
}

module "guardduty" {
  source                           = "../"
  guardduty_logging_bucket_name    = "${var.guardduty_logging_bucket_name}"
  guardduty_logging_prefix         = "${var.guardduty_logging_prefix}"
  guardduty_logging_bucket_kms_arn = "${var.guardduty_logging_bucket_kms_arn}"
}