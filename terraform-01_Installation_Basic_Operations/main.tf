provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.38.0"
    }
  }
}

resource "aws_instance" "jason-ec2" {
  ami = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
  tags = {
    "Name" = "jason-tf"
  }
}