provider "aws" {
  region      = "eu-west-1"
  max_retries = 5
  access_key  = "AKIARKJ6I2QZROYNO2WS"
  secret_key  = "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"
  default_tags {
    tags = var.tags
  }
}