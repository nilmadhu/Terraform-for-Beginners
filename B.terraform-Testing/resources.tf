
# Creating AWS EC2 Machine using Count and Count.index parameter

resource "aws_instance" "Flash" {
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  ami               = "ami-04b70fa74e45c3917" # Ubuntu AMI-ID's
  count             = 2
  vpc_security_group_ids = ["sg-025eb7be39511d10b"]
  
  tags = {
    name = "Flash-${count.index + 1}"
  }

  # Executing and Performing "user_data for performing bash script task"

  user_data = <<-EOF

                #!/bin/bash
            
                sudo update -y
                sudo apt install curl wget vim docker -y     ##// installing packages like cutl, wget, docker, vim

                mkdir /tmp/nilesh        # Creating a new directory

                touch z{1..10}            # Creating a new file

            EOF
}

# key-pair creating

resource "aws_key_pair" "boss" {
  key_name   = "Boss"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDANyuhvNX69ZBgPhEvxJtARvlL4GaRgyDf8JORirKo1YMbY7c23lsHxaBAMu8J/9xF1Xb0nQ4WapOciu8oS+EvPp/9WMCpsVLlDKH73ynb+cYZO92byBBgfywguwDWgT8dHSVXao4efWIkQorlLzAWqrXquayBwEkybURIc9L8LKM4Kn+jesQCIuGKKjUnXD7dGYEQCC+g7wiwI309l7p6nEzecw3jiEcuDP8OqPEItVUhk8GXKnIWjDCY+EvYmDPmizx3KU5q+6EIADbYjcB8EJka6yO7qVlLAxLuMEHYQM6IRzjKaUWSA1F/kL9tnmEkHZiivaFyEKRKHHSHjlzBVrTO5CEG415Xa9/z3paU7QzjtjjAYJWa4rdKeWOZeiuspNyMOiEf7Xb75B8Jh/RHafZuzqNX6Bh/fLe2HLbZfV1Nl4t/GtMHra/INSkZxlbGeWnBnnydXs8gL6Ctq7WquPrEaif112IeywinrVeYW7MRJBK/2YfpWJS+Ph3etuU= SINGH NILESH@DESKTOP-5DDTDRF"
}

# creating S3 bucket

resource "aws_s3_bucket" "Bucket" {
  bucket = "My-First-Bucket"
}

# Creating EBS Volume 

resource "aws_ebs_volume" "EBS" {
  availability_zone = "us-east-1a"
  size              = 10

  tags = {
    name = "Creating EBS volume for sample"
  }
}

