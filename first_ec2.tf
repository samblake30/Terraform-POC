#Configure the AWS Credentials with terraform
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAIILHES55MS5MGD5Q"
  secret_key = "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"

}

resource "aws_instance" "myec2" {
  ami = "ami-09a7bbd08886aafdf"
  instance_type = "t2.micro"
  tags = {
    Name = "First-Terraform-Instance"
  }
}
