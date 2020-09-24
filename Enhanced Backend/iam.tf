terraform {
  required_version = "~> 0.13.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "HIVECorps"

    workspaces { name = "Terraform-POC" }
  }
}


resource "aws_iam_user" "lb" {
  name = "remoteuser"
  path = "/system/"
}
