terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.0"
    }
    #Can be used for adding the Multiple Providers also in single file
    //digitalocean = {
    //source = "digitalocean/digitalocean"
    //}
  }
  required_version = "<= 0.13"
}

resource "aws_instance" "instance-1" {
  ami           = "ami-09a7bbd08886aafdf"
  instance_type = "t2.micro"
  count         = 3
}
