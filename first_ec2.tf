#Configure the AWS Credentials with terraform
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAIG46MNA73K65LDIQ"
  secret_key = "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"

}

resource "aws_instance" "samblake30ec2" {
  ami = "ami-09a7bbd08886aafdf"
  instance_type = "t2.micro"
  tags = {
    Name = "First-Terraform-Instance"
  }
}
