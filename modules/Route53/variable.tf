variable "domain_name" {
  type = string
  description = "Name of the domain"
  default = ""
}

variable "zone_id" {
  type = string
  description = "Zone ID of the S3 bucket"
  default = ""
}

variable "website_domain" {
  type = string
  description = "Website domain of the S3 bucket"
  default = ""
}