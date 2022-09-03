terraform {
  /*
  cloud {
    workspaces {
      name = "learn-terraform-data-sources-app"
    }
  }
  */

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-082cfa95db1071089"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
