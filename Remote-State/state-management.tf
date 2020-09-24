resource "aws_instance" "webapp" {
  ami           = "ami-0e9182bc6494264a4"
  instance_type = "t2.micro"
}

resource "aws_iam_user" "lb1" {
  name = "loadbalancer"
  path = "/system/"
}

terraform {
  backend "s3" {
    bucket = "myankit"
    key    = "terraform.tfstate"
    region     = "ap-south-1"
    access_key = "PUT YOUR ACCESS KEY"
    secret_key = "PUT YOUR SECRET KEY"
    dynanodb_table = "PUT TABLE NAME HERE"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.5.0"
    }
  }
  required_version = ">= 0.13"
}
