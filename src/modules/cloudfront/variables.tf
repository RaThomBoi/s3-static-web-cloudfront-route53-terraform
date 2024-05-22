variable "origin_domain_name" {
    default = {}
}

variable "website_bucket" {
    default = {}
}

variable "log_bucket_id" {
    type = string
    description = "s3 bucket for store log data from CloudFront distribution."
    default = ""
}

variable "geo_whitelist_restriction_locations" {
    type = list(string)
    default = ["SG", "TH", "US", "CA", "GB", "DE"]
}