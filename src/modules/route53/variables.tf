variable "hosted_zone_id" {
    type = string
    default = "your hosted zone id"
}

variable "a_alias_record_to_cloudfront_distribution" {
  description = "A record which alias to s3's cloudfront distribution "
  default = "dev"
}

variable "cloudfront_distribution_domain_name" {
  description = "Domain name of CloudFront distribution (that we set alias to it in cloudfront module)"
  type = string
}

variable "aws_cloudfront_distribution_hosted_zone_id" {
  type = string
}