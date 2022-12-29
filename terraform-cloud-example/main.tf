terraform {
  cloud {
    organization = "test-org-rn"

    workspaces {
      name = "terraform-cert-prep"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20.0"
    }
  }
}


provider "aws" {
  region = var.region
}


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"
  name    = "single-instance"

  ami                    = var.ami
  instance_type          = var.instance-type
  monitoring             = true
  vpc_security_group_ids = [local.security-group]
  subnet_id              = local.subnet

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}