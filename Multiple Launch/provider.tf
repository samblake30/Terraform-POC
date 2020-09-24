#To show alias usage Provider Block is included
provider "aws" {
  region     = "us-west-1"
  access_key = "PUT YOUR ACCESS KEY"
  secret_key = "PUT YOUR SECRET KEY"
}


provider "aws" {
  alias = "mumbai"
  region     = "ap-south-1"
  access_key = "PUT YOUR ACCESS KEY"
  secret_key = "PUT YOUR SECRET KEY"
}
