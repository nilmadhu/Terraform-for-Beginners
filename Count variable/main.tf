# Provider details

provider "aws" {
  region = "us-east-1"
}

# Creating EC2 instance

resource "aws_instance" "loki" {
  ami               = "ami-0bb84b8ffd87024d8"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  count             = 2

  tags = {
    name = "thor-${count.index + 1}"
  }

}

# Creating Key-apir for Instance and Please note use your system public key path: C:\Users\SINGH NILESH/.ssh/id_rsacd

resource "aws_key_pair" "Testing-count-pair" {
  key_name   = "count-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDANyuhvNX69ZBgPhEvxJtARvlL4GaRgyDf8JORirKo1YMbY7c23lsHxaBAMu8J/9xF1Xb0nQ4WapOciu8oS+EvPp/9WMCpsVLlDKH73ynb+cYZO92byBBgfywguwDWgT8dHSVXao4efWIkQorlLzAWqrXquayBwEkybURIc9L8LKM4Kn+jesQCIuGKKjUnXD7dGYEQCC+g7wiwI309l7p6nEzecw3jiEcuDP8OqPEItVUhk8GXKnIWjDCY+EvYmDPmizx3KU5q+6EIADbYjcB8EJka6yO7qVlLAxLuMEHYQM6IRzjKaUWSA1F/kL9tnmEkHZiivaFyEKRKHHSHjlzBVrTO5CEG415Xa9/z3paU7QzjtjjAYJWa4rdKeWOZeiuspNyMOiEf7Xb75B8Jh/RHafZuzqNX6Bh/fLe2HLbZfV1Nl4t/GtMHra/INSkZxlbGeWnBnnydXs8gL6Ctq7WquPrEaif112IeywinrVeYW7MRJBK/2YfpWJS+Ph3etuU= SINGH NILESH@DESKTOP-5DDTDRF"

}

# Creating IAM user. 

resource "aws_iam_user" "user" {
  name = "hella"

}

# Creating Security-Group

resource "aws_security_group" "SG" {
  name = "batman"

  ingress {
    description = "using ssh protcol"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  ingress {
    description = "using HTTP protcol"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  egress {

    description = "using Allow all traffics & protcol"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Defining Variables for CIDR_block

variable "cidr" {
  default = "192.168.0.0/20"
}

# Creating VPC

resource "aws_vpc" "superman" {
  cidr_block = "192.168.0.0/16"
  tags = {
    name = "ankit-vpc"
  }
}

# Creating subnet-mask
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.superman.id
  availability_zone = "us-east-1a"
  cidr_block      = var.cidr
  tags = {
    name = "xyz-subnet"
  }
}

#Internet-gateway creating

resource "aws_internet_gateway" "IG-ankit" {
  vpc_id = aws_vpc.superman.id
  tags = {
    name = "ig-ankit"
  }
}

# creating routing table

resource "aws_route_table" "ankit-route" {
  vpc_id = aws_vpc.superman.id
  tags = {
    name = "Route-ankit"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.IG-ankit.id
  }
}

# CIDR-Association in Route-Table

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.ankit-route.id
}