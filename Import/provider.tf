#Here just to show I have put the Provider Block BUt i have set env variables for my region, access key and secret key
provider "aws" {
  region     = "REGION"
  access_key = "PUT ACCESS KEY"
  secret_key = "PUT SECRET KEY"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.5.0"
    }
  }
  required_version = "~>0.13"
}
