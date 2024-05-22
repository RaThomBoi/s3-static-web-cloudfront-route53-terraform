module "s3_website_bucket" {
  source = "../modules/s3/website_bucket"
  cloudfront_distribution_arn = module.cloudfront.distribution_arn
}

module "s3_website_log_bucket" {
  source = "../modules/s3/log_bucket"
  cloudfront_distribution_arn = module.cloudfront.distribution_arn
}

module "cloudfront" {
  source = "../modules/cloudfront"
  origin_domain_name = module.s3_website_bucket.website_bucket_endpoint
  website_bucket = module.s3_website_bucket
  log_bucket_id = module.s3_website_log_bucket.website_bucket_id
}

module "route53"{
  source = "../modules/route53"
  depends_on = [ module.cloudfront ]
  cloudfront_distribution_domain_name = module.cloudfront.cloudfront_distribution_domain_name
  cloudfront_distribution_hosted_zone_id = module.cloudfront.cloudfront_distribution_hosted_zone_id
}