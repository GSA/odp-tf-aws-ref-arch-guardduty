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
  guardduty_logging_target_bucket          = "${module.grace_logging.access_bucket_id}"
  guardduty_logging_prefix                 = "${var.guardduty_logging_prefix}"
  guardduty_bucket_backup_days             = "${var.guardduty_bucket_backup_days}"
  guardduty_bucket_backup_expiration_days  = "${var.guardduty_bucket_backup_expiration_days}"
  guardduty_bucket_enable_backup           = "${var.guardduty_bucket_enable_backup}"
}