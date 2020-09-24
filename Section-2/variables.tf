variable "myip" {
  default = "119.25.20.50"
}

resource "aws_security_group" "allow_tls" {
  name        = "mysecurity_Group"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.myip}/32"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.myip}/32"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["${var.myip}/32"]
  }
}

output "mysecgrp" {
  value = aws_security_group.allow_tls
}
