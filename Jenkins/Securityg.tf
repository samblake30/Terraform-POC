#Create the Security group

resource "aws_security_group" "jenkinssecgrp" {
  dynamic "ingress" {
    for_each = var.sgingress_port
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.cidr
    }
  }
  tags = {
    Name        = "Jenkins Security Group"
    Description = "Jenkins Security Group"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
