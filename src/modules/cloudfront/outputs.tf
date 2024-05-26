# for Route53 Hosted zone
output "distribution_domain_name" {
  value = aws_cloudfront_distribution.main.domain_name
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.main.hosted_zone_id
}

# for S3 bucket
output "arn" {
  value = aws_cloudfront_distribution.main.arn
}

