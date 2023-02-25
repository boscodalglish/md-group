output "website_domain" {
  value = data.aws_s3_bucket.selected-bucket.website_domain
}

output "hosted_zone_id" {
  value = data.aws_s3_bucket.selected-bucket.hosted_zone_id
}

output "s3_object_url" {
    value = [ for vnet in aws_s3_object.object-upload-html: "https://s3.${vnet.tags_all.region}.amazonaws.com/${vnet.bucket}/${vnet.id}"]
}