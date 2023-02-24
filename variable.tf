variable "domain_name" {
  type        = string
  description = "Name of the domain"
  default     = ""
}

variable "bucket_name" {
  type        = string
  description = "Name of the bucket."
}

variable "tags" {}

variable "suffix" {
  default = "index.html"
}
variable "suffix_key" {
  default = "404.jpeg"
}

variable "access_key" {}

variable "secret_key" {

}
