variable "instancetype" {
  //default = "t2.micro"
}

resource "aws_instance" "myec2" {
  ami = "ami-09a7bbd08886aafdf"
  instance_type = var.instancetype
  tags = {
    Name = "First-Terraform-Instance"
  }
}
