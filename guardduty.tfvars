grace_logging_bucket_name = "odp-aws-ref-arch-1-odp-logging-logging-development"
guardduty_logging_prefix  = "odp-guardduty"
## Commenting below lines - becuase we are pushing guard duty logs to existing logging bucket for ELK"
# guardduty_bucket_acl                     = "log-delivery-write"
# guardduty_bucket_destroy                 = true
# guardduty_bucket_enable_versioning       = true
# guardduty_bucket_block_public_acls       = true
# guardduty_bucket_ignore_public_acls      = true
# guardduty_bucket_block_public_policy     = true
# guardduty_bucket_restrict_public_buckets = true
# guardduty_logging_target_bucket          = "odp-aws-ref-arch-1-grace-logging-access-development"
# guardduty_bucket_backup_days             = "365"
# guardduty_bucket_backup_expiration_days  = "900"
# guardduty_bucket_enable_backup           = true