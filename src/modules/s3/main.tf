resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
}


# enforce bucket ownership: it's enabled by default to ignore ACLs in the bucket 
# it's mean bucket policy will be applied to all the object
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html

# block all public acess to this bucket
# by default it not allow any public access
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html


# upload file into the bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.main.bucket
  key = var.index_key
  source = "${path.module}/s3_content/index.html"
}

resource "aws_s3_object" "image" {
  bucket = aws_s3_bucket.main.bucket
  key = var.image_key
  source = "${path.module}/s3_content/me.jpeg"
}


    data "aws_iam_policy_document" "allow_cloudfront_distrobution_access" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = ["${aws_s3_bucket.main.arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [var.cloudfront_distribution_arn]
    }
  }
}


resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.main.id
  policy = data.aws_iam_policy_document.allow_cloudfront_distrobution_access.json
}
