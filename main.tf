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
  provisioner "local-exec" {
    command = "aws guardduty create-publishing-destination --detector-id ${aws_guardduty_detector.detector.id} --destination-type S3 --destination-properties DestinationArn=arn:aws:s3:::${var.guardduty_bucket_name},KmsKeyArn=arn:aws:kms:${local.region}:${local.account_id}:key/${aws_kms_key.guardduty_kms_key.key_id}"
  }
  depends_on = [aws_guardduty_detector.detector, aws_kms_key.guardduty_kms_key, aws_s3_bucket_public_access_block.guardduty]
}