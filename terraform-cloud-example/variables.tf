variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

variable "vpc-config" {
  description = "subnet id and security group to associate ec2 instance in vpc"
  type        = map(string)
  default = {
    "subnet"         = "subnet-eddcdzz4"
    "security-group" = "sg-12345678"
  }
}

locals {
  subnet         = var.vpc-config.subnet
  security-group = var.vpc-config.security-group
}


variable "ami" {
  description = "ami id"
  type        = string
  default     = "ami-0ff8a91507f77f867"
}

variable "instance-type" {
  description = "type of ec2 instance"
  type        = string
  default     = "t2.micro"
}




