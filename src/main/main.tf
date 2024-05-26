module "s3_bucket" {
  source = "../modules/s3"
  cloudfront_distribution_arn = module.cloudfront_distribution.arn
}

module "cloudfront_distribution" {
  source = "../modules/cloudfront"
  s3_bucket = module.s3_bucket.s3_bucket
  s3_bucket_regional_domain_name = module.s3_bucket.s3_bucket_regional_domain_name
}

module "route53_hosted_zone" {
  source = "../modules/route53"
  cloudfront_distribution_domain_name = module.cloudfront_distribution.distribution_domain_name
  aws_cloudfront_distribution_hosted_zone_id = module.cloudfront_distribution.hosted_zone_id
}