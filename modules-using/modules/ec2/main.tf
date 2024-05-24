provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web1" {
  ami           = var.ami_name
  instance_type = var.instance_type_name

  tags = {
    Name = var.instance_name
  }
}