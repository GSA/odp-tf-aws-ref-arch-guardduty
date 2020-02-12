resource "aws_kms_key" "guardduty_kms_key" {
  description             = "Key for guardduty"
  deletion_window_in_days = 7
  enable_key_rotation     = "true"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${local.account_id}:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    },
    {
      "Sid": "Allow GuardDuty to use the key",
      "Effect": "Allow",
      "Principal": {
        "Service": "guardduty.amazonaws.com"
      },
      "Action": "kms:GenerateDataKey",
      "Resource": "*"
    },
    {
      "Sid": "Allow use of the key",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::781119243238:root"
      },
      "Action": [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
      ],
      "Resource": "*"
    }
  ]
}
EOF

}

resource "aws_kms_alias" "kms_alias" {
  name          = "alias/guardduty"
  target_key_id = aws_kms_key.guardduty_kms_key.key_id
}

