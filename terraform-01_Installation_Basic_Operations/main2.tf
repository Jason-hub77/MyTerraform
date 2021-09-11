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

resource "aws_instance" "jsn-tf" {
  ami = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
  key_name = "2078_ofc"    # write your pem file without .pem extension>
  tags = {
    "Name" = "jsn-ec2"
  }
}

resource "aws_s3_bucket" "jsn-s3" {
  bucket = "jsn-test-bucket"
  acl    = "private"
}