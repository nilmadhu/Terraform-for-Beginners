module "ec2" {
  source             = "./modules/ec2"
  ami_name           = "ami-0bb84b8ffd87024d8"
  instance_type_name = "t2.micro"
  instance_name      = "batman"
}