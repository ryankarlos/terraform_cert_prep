# Terraform configuration

terraform {
  backend "s3" {
    bucket = "terraform-scripts-state"
    key    = "s3-website.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "terraform-test-website-122022"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
