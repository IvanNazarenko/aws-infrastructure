provider "aws" {
}

variable "bucket_name" {
  type = string
  description = "neme of bucket"
}
#
#resource "aws_s3_bucket" "storage" {
#  bucket = var.bucket_name
#  tags = {
#    target = "learning"
#  }
#}
#
#resource "aws_s3_bucket_object" "bootstrap" {
#  bucket = var.bucket_name
#  key = "bootsrap.sh"
#  source = "bootstrap.sh"
#}
#
#resource "aws_security_group" "open-ssh" {
#  name = "open-ssh"
#  description = "ssh from anywhere"
#  ingress {
#    from_port = 0
#    protocol = "tcp"
#    to_port = 22
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  egress {
#    from_port = 0
#    protocol = "-1"
#    to_port = 0
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#  tags = {
#    target = "learning"
#  }
#}
#
#resource "aws_key_pair" "wayne" {
#  key_name = "virginia"
#  public_key = file("id_rsa.pub")
#}
#
#resource "aws_instance" "vm-for-moodle" {
#  ami = "ami-0885b1f6bd170450c"
#  instance_type = "t2.micro"
#  user_data = file("bootstrap.sh")
#  key_name = aws_key_pair.wayne.key_name
#  root_block_device {
#    delete_on_termination = true
#    volume_size = 8
#    volume_type = "gp2"
#  }
#  tags = {
#   target = "learning"
#  }
#  security_groups = ["open-ssh"]
#}