variable "bucket_name" {
  type = string
  default = "input your desired bucket name"
}

variable "index_key" {
  type = string
  default = "index.html"
}

variable "image_key" {
  type = string
  default = "me.jpeg"
}

variable "cloudfront_distribution_arn" {
  type = string
}
