variable "domain_name" {
  type = string
  description = "Name of the domain"
  default = ""
}
variable "bucket_name" {
  type = string
  description = "Name of the bucket."
}
variable "region" {
    type = string
    default = "us-west-1"
}
variable "enable_versioning" {
    type = bool
    default = true
}
