resource "aws_cloudfront_distribution" "main" {
  aliases = [var.distribution_aliases_domain]
  enabled = true
  is_ipv6_enabled = true
  wait_for_deployment = true
  default_root_object = "index.html"

  # configure saching behavior
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    # https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html
    cache_policy_id = var.caching_optimized_id
    target_origin_id = var.s3_bucket
    viewer_protocol_policy = "redirect-to-https"
  }

  origin {
    domain_name = var.s3_bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.main.id
    origin_id = var.s3_bucket
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.root_domain_public_certificate_arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }

}

resource "aws_cloudfront_origin_access_control" "main" {
  name                              = "s3-cloudfront-oac"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}