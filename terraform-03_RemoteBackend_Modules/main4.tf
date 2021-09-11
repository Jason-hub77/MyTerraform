terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.38.0"
    }
  }

  backend "s3" {
    bucket = "tf-remote-s3-bucket-jason-changehere"
    key = "env/dev/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "tf_ami" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

locals {
  instance-name = "jason-local-name"
}


resource "aws_instance" "jason-ec2" {
  ami           = data.aws_ami.tf_ami.id
  instance_type = var.ec2-type
  key_name      = "2078_ofc" # write your pem file without .pem extension>
  tags = {
    "Name" = "${local.instance-name}-1977"
  }
}

# locals {
#   bucket-name = "jason-local-bucket-name"
# }

resource "aws_s3_bucket" "jsn-s3" {
  # bucket = "${var.s3-bucket-name}-${count.index + 1}"
  acl    = "private"
  # count = var.num_of_buckets
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 3
  for_each = toset(var.users)
  bucket   = "example-s3-bucket-${each.value}"
}

resource "aws_iam_user" "new_users" {
  for_each = toset(var.users)
  name = each.value
}

output "uppercase_users" {
  value = [for user in var.users : upper(user) if length(user) > 5]
}

output "tf-example-public-ip" {
  value = aws_instance.jason-ec2.public_ip
}

# output "tf-example-s3-meta" {
#   value = aws_s3_bucket.jsn-s3.region
# }

output "tf-example-private-ip" {
  value = aws_instance.jason-ec2.private_ip
}

# output "tf-example-s3" {
#   value = aws_s3_bucket.jsn-s3[*]
# }

output "s3-arn-1" {
  value = aws_s3_bucket.jsn-s3["ulvi"].arn
  }

output "s3-arn-2" {
  value = aws_s3_bucket.jsn-s3["veli"].arn
  }