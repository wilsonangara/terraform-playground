output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.my_bucket.arn
}

output "bucket_domain" {
  description = "The regional domain name (useful for website hosting)"
  value       = aws_s3_bucket.my_bucket.bucket_regional_domain_name
}

