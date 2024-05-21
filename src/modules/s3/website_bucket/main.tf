resource "aws_s3_bucket" "website_bucket" {
    bucket = var.website_bucket_name
}

resource "aws_s3_bucket_website_configuration" "website_bucket_website_hosting_configuration" {
    bucket = aws_s3_bucket.website_bucket

    index_document {
        suffix = var.index_document
    }

    error_document {
        key = var.error_document
    }
}

resource "aws_s3_bucket_public_access_block" "website_bucket_public_access_configuration" {
    bucket = aws_s3_bucket.website_bucket

    block_public_acls = true
    ignore_public_acls = true
    block_public_policy = true # maybe this value should be false
    restrict_public_buckets = true # maybe this value should be false
}

# bucket policy to allow cloudfront distribution getting object from this bucket
# data "aws_iam_policy_document" "website_bucket_policy" {
#   statement {
#     actions = ["s3:GetObject"]
#     resources = ["${aws_s3_bucket.website_bucket.arn}/*"]
#     principals {
      
#     }
#   }
# }


output "website_bucket_id" {
  value = aws_s3_bucket.website_bucket.id
}
output "website_bucket_endpoint" {
  value = aws_s3_bucket.website_bucket.website_endpoint
}
