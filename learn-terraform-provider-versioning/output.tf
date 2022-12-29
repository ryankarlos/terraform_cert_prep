output "bucket_arn" {
  value       = aws_s3_bucket.sample.*.arn
  description = "Bucket ARN"
}