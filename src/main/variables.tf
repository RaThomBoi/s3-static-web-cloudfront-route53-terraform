variable "website_bucket_name" {
  default = "jessada-corp-website-bucket"
}

variable "website_log_bucket_name" {
  default = "jessada-corp-website_log-bucket"
}

variable "region" {
default = "ap-southeast-1"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS Access Key ID"
  type        = string
  default     = ""
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS Secret Access Key"
  type        = string
  default     = ""
}