#For AWS instance creation provider details are already used as env variables in my case
resource "aws_instance" "myec2" {
  ami = "ami-09a7bbd08886aafdf"
  instance_type = "t2.micro"
  tags = {
    Name = "First-Terraform-Instance"
  }
}
