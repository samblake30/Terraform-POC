resource "aws_instance" "myec2" {
  ami                    = "ami-052c08d70def0ac62"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-091e0eaa6dccf86fe", "sg-b473bcd6"]
  key_name               = "rke"
  subnet_id              = "subnet-b2dde4da"
  iam_instance_profile = "aws-ec2-s3"

  tags = {
    Name = "Terraform"
  }
}
