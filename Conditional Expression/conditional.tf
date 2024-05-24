
provider "aws" {
  region = "us-east-1"
}

variable "is_dev_prod" {
  description = "Submit your answer in True or False"
  type        = bool
}

resource "aws_instance" "ocean" {
  #conditional express used case.
  count         = var.is_dev_prod == true ? 1 : 0
  ami           = "xxxxaaaxxcac"
  instance_type = "t2.micro"
  tags = {
    name = "dev-ec2"
  }
}

resource "aws_instance" "sky" {
  count         = var.is_dev_prod == false ? 2 : 0
  ami           = "sfbksfkskfbskfbks"
  instance_type = "t2.micro"
  tags = {
    name = "prod-ec2"
  }
}

