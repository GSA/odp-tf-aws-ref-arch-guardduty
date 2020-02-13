provider "aws" {
  region  = "us-east-1"
}

module "guardduty" {
  source                                   = "../"
  guardduty_bucket_name                    = "${var.guardduty_bucket_name}"
  guardduty_bucket_acl                     = "${var.guardduty_bucket_acl}"
  guardduty_bucket_destroy                 = "${var.guardduty_bucket_destroy}"
  guardduty_bucket_enable_versioning       = "${var.guardduty_bucket_enable_versioning}"
  guardduty_bucket_block_public_acls       = "${var.guardduty_bucket_block_public_acls}"
  guardduty_bucket_ignore_public_acls      = "${var.guardduty_bucket_ignore_public_acls}"
  guardduty_bucket_block_public_policy     = "${var.guardduty_bucket_block_public_policy}"
  guardduty_bucket_restrict_public_buckets = "${var.guardduty_bucket_restrict_public_buckets}"
}