variable "mytags" {
  type    = list(string)
  default = ["First", "Second"]
}


output "my-public-ip" {
  value = aws_instance.apache-ec2[*].public_ip
}
