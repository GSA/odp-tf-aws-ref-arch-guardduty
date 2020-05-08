data "aws_caller_identity" "current" {
}

data "aws_region" "current" {
}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}

resource "aws_guardduty_detector" "detector" {
  enable = true
}

resource "null_resource" "output_id" {

  triggers = {
    always_run    = "${timestamp()}"
    export_bucket = var.guardduty_logging_bucket_name
  }

  provisioner "local-exec" {
    command = "aws guardduty create-publishing-destination --detector-id ${aws_guardduty_detector.detector.id} --destination-type S3 --destination-properties DestinationArn=arn:aws:s3:::${var.guardduty_logging_bucket_name}/${var.guardduty_logging_prefix},KmsKeyArn=arn:aws:kms:${local.region}:${local.account_id}:key/${aws_kms_key.guardduty_kms_key.key_id}"
  }
  depends_on = [aws_guardduty_detector.detector, aws_kms_key.guardduty_kms_key, aws_s3_bucket_policy.guardduty]
}