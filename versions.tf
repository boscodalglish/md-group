terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket  = "md-group-008-tfstate"
    key     = "md-group-008-tfstate.tfstate"
    region  = "eu-west-1"
    encrypt = "true"
  }
}