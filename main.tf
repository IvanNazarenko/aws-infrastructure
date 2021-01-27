provider "aws" {
}

variable "bucket_name" {
  type = string
  description = "neme of bucket"
}
resource "aws_s3_bucket" "storage" {
  bucket = var.bucket_name
  source ="${file("bootstrap.sh")}"
  tags = {
    Username = learning
  }
}

resource "aws_security_group" "open-ssh" {
  name = "open-ssh"
  description = "ssh from anywhere"
  ingress {
    from_port = 22
    protocol = "SSH"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Username = learning
  }
}

resource "aws_key_pair" "wayne" {
  key_name = "virginia"
  public_key = "ssh-rsa"
}

resource "aws_instance" "vm-for-moodle" {
  ami = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  user_data ="${file("bootstrap.sh")}"
  key_name = "${aws_key_pair.wayne.key_name}"
  root_block_device {
    delete_on_termination = true
    volume_size = 8
    volume_type = "General Purpose SSG (gp2)"
  }
  tags = {
    Username = learning
  }
  security_groups = ["open-ssh"]
}