# Creating securtiy group

resource "aws_security_group" "protocol" {
  name = var.security_group

  ingress {
    description = "define the http port number"
    from_port   = var.port_number[0]
    to_port     = var.port_number[0]
    protocol    = "tcp"
    cidr_blocks = [var.cidr]

  }

  ingress {
    description = "define the https port number"
    from_port   = var.port_number[1]
    to_port     = var.port_number[1]
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  ingress {
    description = "define the jenkins port number"
    from_port   = var.port_number[2]
    to_port     = var.port_number[2]
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  ingress {
    description = "define the RDP port number"
    from_port   = var.port_number[3]
    to_port     = var.port_number[3]
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  egress {
    description = "open for all protocolsr"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = var.security_group
  }

}