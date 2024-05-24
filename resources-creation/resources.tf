resource "aws_instance" "web1" {
  ami           = "ami-0bb84b8ffd87024d8" #amazon-linux-id
  instance_type = "t2.micro"
  # vpc_security_group_ids = ["sg-05927ed78569b62eb"]

  tags = {
    Name = "sonarqube"
  }
}
