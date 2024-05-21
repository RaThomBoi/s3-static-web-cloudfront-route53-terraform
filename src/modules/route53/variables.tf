variable "cloudfront_distribution_domain_name" {
    description = "CloudFront distribution domain name"
    type = string
}

variable "cloudfront_distribution_hosted_zone_id" {
  description = "CloudFront distribution hosted zone's id used for Route53 alias name configuration"
  type = string
}

variable "aws_route53_zone_name" {
  default = "jessadasrimoon.com"
}

variable "aws_route53_record_name" {
   default = "www.jessadasrimoon.com"
}