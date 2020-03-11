# Create Bucket
resource "aws_s3_bucket" "guardduty" {
  bucket        = var.guardduty_bucket_name
  acl           = var.guardduty_bucket_acl
  force_destroy = var.guardduty_bucket_destroy

  versioning {
    enabled = var.guardduty_bucket_enable_versioning
  }

  logging {
    target_bucket = var.guardduty_logging_target_bucket
    target_prefix = var.guardduty_logging_prefix
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    enabled = var.guardduty_bucket_enable_backup

    prefix = var.guardduty_logging_prefix

    transition {
      days          = var.guardduty_bucket_backup_days
      storage_class = "GLACIER"
    }

    expiration {
      days = var.guardduty_bucket_backup_expiration_days
    }
  }
}

# Set Public Access Block
resource "aws_s3_bucket_public_access_block" "guardduty" {
  bucket = aws_s3_bucket.guardduty.id

  block_public_acls       = var.guardduty_bucket_block_public_acls
  ignore_public_acls      = var.guardduty_bucket_ignore_public_acls
  block_public_policy     = var.guardduty_bucket_block_public_policy
  restrict_public_buckets = var.guardduty_bucket_restrict_public_buckets
}

data "template_file" "bucket_policy" {
  template = file("${path.module}/files/bucket_policy.tpl.json")
  vars = {
    guardduty_bucket = var.guardduty_bucket_name
    gd_kms_key_id    = aws_kms_key.guardduty_kms_key.key_id
    aws_account_id   = data.aws_caller_identity.current.account_id
    aws_region       = data.aws_region.current.name
  }
}

# Create Bucket Policy
resource "aws_s3_bucket_policy" "guardduty" {
  bucket     = aws_s3_bucket.guardduty.id
  policy     = data.template_file.bucket_policy.rendered
  depends_on = [aws_s3_bucket_public_access_block.guardduty]
}
