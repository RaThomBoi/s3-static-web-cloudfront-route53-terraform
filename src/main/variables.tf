variable "website_bucket_name" {
  default = "jessada-corp-website-bucket"
}

variable "website_log_bucket_name" {
  default = "jessada-corp-website_log-bucket"
}

variable "region" {
default = "ap-southeast-1"
}

variable "aws_access_key_id" {
  type = string
  default = ""
}
variable "aws_secret_access_key" {
  type = string
  default = ""
}