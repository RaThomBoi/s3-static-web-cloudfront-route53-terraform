resource "aws_route53_record" "main" {
  name = var.a_alias_record_to_cloudfront_distribution
  type = "A"
  zone_id = var.hosted_zone_id

  alias {
    evaluate_target_health = false
    name = var.cloudfront_distribution_domain_name
    zone_id = var.aws_cloudfront_distribution_hosted_zone_id
  }
}