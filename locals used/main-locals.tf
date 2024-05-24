
provider "aws" {
  region = "us-east-1"
}

# We can use local variables for defing same tags key or values in all the resouces.

locals {
  common_values = {
    name = "thor"
    cap  = "wear"
    env  = "production"
  }
}
resource "aws_instance" "loki" {
  ami               = "ami-0bb84b8ffd87024d8"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  count             = 2

  tags = local.common_values

}

resource "aws_instance" "Pod" {
  ami               = "ami-0bb84b8ffd87024d8"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  count             = 2

  tags = local.common_values
}

resource "aws_instance" "God" {
  ami               = "ami-0bb84b8ffd87024d8"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  count             = 2

  tags = local.common_values
}

resource "aws_ebs_volume" "ebs" {
  availability_zone = "us-east-1a"
  size              = 10

  tags = local.common_values
}