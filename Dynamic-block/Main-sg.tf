provider "aws" {
  region = "us-east-1"
}
 
variable "cidr" {
  default = "192.168.1.0/24"
}
 
variable "ingress_value" {
  type    = list(number)
  default = [80, 443, 22]
}
 
variable "egress_value" {
  type    = list(number)
  default = [8080, 9090]
}
 
resource "aws_security_group" "example" {
  name = "myfirewall"
 
  dynamic "ingress" {
    for_each = var.ingress_value
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.cidr]
    }
  }
 
  dynamic "egress" {
    for_each = var.egress_value
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}