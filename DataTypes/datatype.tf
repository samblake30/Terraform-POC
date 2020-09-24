provider "aws" {
  region     = "PUT YOUR REGION"
  access_key = "PUT YOUR ACCESS KEY"
  secret_key = "PUT YOUR SECRET KEY"

}

resource "aws_iam_user" "myiam" {
  name = var.usernum
  path = "/system/"
}
