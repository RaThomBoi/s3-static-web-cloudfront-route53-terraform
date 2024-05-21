resource "aws_route53_zone" "priamry" {
  name = var.aws_route53_zone_name
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.priamry.zone_id
  name = var.aws_route53_record_name
  type = "A"
  alias {
    name = var.cloudfront_distribution_domain_name
    evaluate_target_health = true
    zone_id = var.cloudfront_distribution_hosted_zone_id
  }
}