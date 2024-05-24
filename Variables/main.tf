# Resources defining

# resource "aws_instance" "bull" {

#   ami               = "ami-0bb84b8ffd87024d8" # Amazonn-linux
#   instance_type     = "t2.micro"
#   availability_zone = "us-east-1a"

#   tags = {
#     name = var.machine_name
#   }
# }

# variable example:

resource "aws_instance" "bull" {

  ami               = "ami-0bb84b8ffd87024d8" # Amazonn-linux
  instance_type     = var.instance_type["devops"]
  availability_zone = "us-east-1a"

  tags = {
    name = var.machine_name
  }
}

resource "aws_instance" "fox" {

  ami               = "ami-0bb84b8ffd87024d8" # Amazonn-linux
  instance_type     = var.instance_type["devops"]
  availability_zone = "us-east-1a"

  tags = {
    name = var.machine_name
  }
}

resource "aws_instance" "boss" {

  ami               = "ami-0bb84b8ffd87024d8" # Amazonn-linux
  instance_type     = var.instance_type["bull"]
  availability_zone = "us-east-1a"

  tags = {
    name = var.machine_name
  }
}


variable instance_type {
    type = map(string)
    default = {

    "bull" = "t2.micro"
    "devops" = "t3.micro"
    }
}