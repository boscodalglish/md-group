output "domain_name" {
  value = module.s3_website.s3_object_url
}

output "error_page" {
  value = module.s3_website.s3_object_url_err
}