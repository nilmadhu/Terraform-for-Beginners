
# #  terraform {
# #   required_providers {
# #     aws = {
# #       source  = "hashicorp/aws"
# #       version = "5.48.0"
# #     }
# #   }
# # }

# # provider "aws" {
# #   region = "us-east-1"
# # }


# resource "aws_instance" "web1" {
#   ami           = "ami-0bb84b8ffd87024d8"
#   instance_type = "t2.micro"
#   # vpc_security_group_ids = ["sg-05927ed78569b62eb"]

#   tags = {
#     Name = "HelloWorld-1"
#   }
# }

# # resource "aws_instance" "web2" {
# #   ami           = "ami-0bb84b8ffd87024d8"
# #   instance_type = "t2.micro"

# #   tags = {
# #     Name = "HelloWorld-2"
# #   }
# # }
