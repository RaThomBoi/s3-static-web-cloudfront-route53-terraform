module "s3_website_hoster_bucket" {
  source = "../modules/s3/website_bucket"
}

module "s3_website_logger_bucket" {
  source = "../modules/s3/logging_bucket"
}

