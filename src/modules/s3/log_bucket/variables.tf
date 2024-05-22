variable "website_log_bucket_name" {
  default = "jessada-corp-website_log-bucket"
}

variable "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  type = string
  default = ""
}

