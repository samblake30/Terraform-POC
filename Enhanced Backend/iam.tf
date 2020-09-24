terraform {
  required_version = "~> 0.13.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "YOUR ORGANIZATION NAME"

    workspaces { name = "YOUR WORKSPACE NAME" }
  }
}


resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"
}
