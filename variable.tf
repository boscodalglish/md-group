variable "bucket_name" {
  type        = string
  description = "Name of the bucket."
}

variable "tags" {}

variable "suffix" {
  default = "index.html"
}

variable "access_key" {}

variable "secret_key" {

}
