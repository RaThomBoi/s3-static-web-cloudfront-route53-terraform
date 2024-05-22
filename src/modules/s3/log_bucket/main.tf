resource "aws_s3_bucket" "website_log_bucket" {
    bucket = var.website_log_bucket_name
}

resource "aws_s3_bucket_public_access_block" "website_log_bucket_public_access_configuration" {
    bucket = aws_s3_bucket.website_log_bucket.id

    block_public_acls = true
    ignore_public_acls = true
    block_public_policy = true
    restrict_public_buckets = true
}


# bucket policy to allow cloudfront distribution logging data into this bucket
data "aws_iam_policy_document" "log_bucket_policy" {
  statement {
    sid = "AllowCloudFrontServicePrincipal"
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    actions = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.website_log_bucket.arn}/*"]
    condition {
      test = "StringEquals"
      variable = "AWS:SourceArn"
      values = [var.cloudfront_distribution_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "log_bucket_policy" {
  bucket = aws_s3_bucket.website_log_bucket.id
  policy = data.aws_iam_policy_document.log_bucket_policy.json
}

output "website_bucket_id" {
  value = aws_s3_bucket.website_log_bucket.id
}
