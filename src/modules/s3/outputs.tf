output "s3_bucket" {
  value = aws_s3_bucket.main.bucket
}

output "s3_bucket_regional_domain_name" {
  value = aws_s3_bucket.main.bucket_domain_name
}