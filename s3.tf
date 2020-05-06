data "template_file" "bucket_policy" {
  template = file("${path.module}/files/bucket_policy.tpl.json")
  vars = {
    guardduty_logging_bucket_name = var.guardduty_logging_bucket_name
    gd_kms_key_id                 = aws_kms_key.guardduty_kms_key.key_id
    aws_account_id                = data.aws_caller_identity.current.account_id
    aws_region                    = data.aws_region.current.name
  }
}

# Create Bucket Policy
resource "aws_s3_bucket_policy" "guardduty" {
  bucket = var.guardduty_logging_bucket_name
  policy = data.template_file.bucket_policy.rendered
}

resource "aws_s3_bucket_object" "guardduty_folder" {
  bucket = var.guardduty_logging_bucket_name
  key    = "odp-guardduty/"
  source = "/dev/null"
}
