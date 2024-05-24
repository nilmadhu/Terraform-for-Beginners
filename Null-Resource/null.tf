provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "null-testing" {

  provisioner "local-exec" {
    command = " mkdir apple "
  }
}
