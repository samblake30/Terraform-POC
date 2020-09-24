variable "istest" {}

resource "aws_instance" "dev" {
  ami = "ami-09a7bbd08886aafdf"
  instance_type = "t2.micro"
  //count = var.istest == true ? 1:0
#This is a condition to spawn 3 instances just like count = 3
  count = var.istest == true ? 3:0
  tags =  {
        Name = "dev-instance"
  }
}

resource "aws_instance" "prod" {
  ami = "ami-09a7bbd08886aafdf"
  instance_type = "t2.large"
  count = var.istest == false ? 1:0
  tags = {
    Name = "prod-instance"
  }
}
