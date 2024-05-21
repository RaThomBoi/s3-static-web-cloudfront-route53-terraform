variable "origin_domain_name" {
    default = {}
}

variable "website_bucket" {
    default = {}
}

variable "log_bucket" {
    default = {}
}

variable "geo_whitelist_restriction_locations" {
    type = list()
    default = ["SG", "TH", "US", "CA", "GB", "DE"]
}