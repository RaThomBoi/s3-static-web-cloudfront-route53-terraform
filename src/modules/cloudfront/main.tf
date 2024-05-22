locals {
  s3_origin_id = "jessadaCorpOrigin"
}

resource "aws_cloudfront_origin_access_control" "s3_oac" {
  name = "website_OAC_S3_access"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.origin_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_oac.id
    origin_id = local.s3_origin_id
  }

    enabled = true
    is_ipv6_enabled = false
    default_root_object = "index.html"

    logging_config {
      include_cookies = false
      bucket = var.log_bucket_id
    }

    # aliases = ["jesscorp.com"]

    default_cache_behavior {
        allowed_methods = ["GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods = ["GET", "HEAD"]
        target_origin_id = local.s3_origin_id

        forwarded_values {
            query_string = false

            cookies {
                forward = "none"
          }
        }

        viewer_protocol_policy = "allow-all"
        min_ttl = 0
        default_ttl = 3600
        max_ttl = 86400
    }

    # Cache behavior with precedence 0
    ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = var.geo_whitelist_restriction_locations
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

}

 output "cloudfront_distribution_domain_name" {
    value = aws_cloudfront_distribution.s3_distribution.domain_name
  }

  output "cloudfront_distribution_hosted_zone_id" {
    value = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
  }

  output "distribution_arn" {
    value = aws_cloudfront_distribution.s3_distribution.arn
  }
