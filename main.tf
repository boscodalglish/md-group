module "s3_website" {
  source      = "./modules/S3"
  bucket_name = var.bucket_name
  domain_name = var.bucket_name
}

module "route_53" {
  source         = "./modules/Route53"
  domain_name    = var.bucket_name
  zone_id        = module.s3_website.hosted_zone_id
  website_domain = module.s3_website.website_domain
  depends_on = [
    module.s3_website
  ]
}
