//This is for Creating the EC2 Instance
resource "aws_instance" "myec2" {
  ami = "ami-09a7bbd08886aafdf"
  instance_type = "t2.micro"
  tags = {
    Name = "First-Terraform-Instance"
  }
}

//This is for Creating the EIP
resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}

output "myeip_association" {
  value = aws_eip_association.eip_assoc
}

resource "aws_security_group" "allow_tls" {
  name        = "mysecurity_Group"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
    //cidr_blocks = aws_eip.lb.public_ip
  }
}

output "mysec" {
  value = aws_security_group.allow_tls
}
