resource "aws_s3_bucket" "website_log_bucket_name" {
    bucket = var.website_log_bucket_name
}

resource "aws_s3_bucket_public_access_block" "website_log_bucket_public_access_configuration" {
    bucket = aws_s3_bucket.website_log_bucket_name

    block_public_acls = true
    ignore_public_acls = true
    block_public_policy = true
    restrict_public_buckets = true
}

output "website_bucket" {
  value = aws_s3_bucket.website_log_bucket_name
}
