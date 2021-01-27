provider "aws" {
}

variable "bucket_name" {
  type = string
  description = "neme of bucket"
}
#resource "aws_s3_bucket" "vidro" {
#  bucket = var.bucket_name
#}