output "guardduty_bucket_arn" {
  description = "The ARN of the guardduty bucket."
  value       = aws_s3_bucket.guardduty.arn
}

output "guardduty_bucket_id" {
  description = "The name of the guardduty bucket."
  value       = aws_s3_bucket.guardduty.id
}
