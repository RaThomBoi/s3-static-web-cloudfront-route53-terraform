variable "distribution_aliases_domain" {
  type = string
  default = "cloudfront distribution alias domain name"
}

variable "caching_optimized_id" {
  type = string
  # Docs: https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html#managed-cache-caching-optimized
  default = "658327ea-f89d-4fab-a63d-7e88639e58f6"
}

variable "s3_bucket" {
    description = "s3 bucket for hosting static website"
    type = string
}

variable "s3_bucket_regional_domain_name" {
  type = string
}

variable "root_domain_public_certificate_arn" {
  type = string
  default = "input your certificate arn"
}