# variable "ec2-name" {
#   default = "jason-ec2"
# }

variable "ec2-type" {
  default = "t2.micro"
}

# variable "ec2-ami" {
#   default = "ami-0742b4e673072066f"
# }

variable "s3-bucket-name" {
  default = "jason-s3-bucket-variable-new"
}

variable "num_of_buckets" {
  default = 2
}

variable "users" {
  default = ["veli", "mehmetali", "ulvi"]
}