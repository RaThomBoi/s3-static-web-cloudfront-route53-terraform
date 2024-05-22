variable "website_bucket_name" {
  default = "jessada-corp-website-bucket"
}

variable "index_document" {
  default = "index.html"
}

variable "error_document" {
  default = "index.html"
}

variable "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  type = string
  default = ""
}