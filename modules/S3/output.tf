output "website_domain" {
  value = data.aws_s3_bucket.selected-bucket.website_domain
}

output "hosted_zone_id" {
  value = data.aws_s3_bucket.selected-bucket.hosted_zone_id
}