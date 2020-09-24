terraform {
  backend "s3" {
    bucket     = "myankit"
    key        = "terraform.tfstate"
    region     = "ap-south-1"
    access_key = "PUT YOUR ACCESS KEY"
    secret_key = "PUT YOUR SECRET KEY"
    dynanodb_table = "PUT TABLE NAME HERE"
  }
}
