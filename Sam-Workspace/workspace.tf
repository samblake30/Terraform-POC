resource "aws_instance" "myec21" {
  ami             = "ami-0e9182bc6494264a4"
  instance_type   = lookup(var.instance_type, terraform.workspace)
  key_name        = "rke"
  security_groups = ["default"]
}

#Create 3 different workspace called dev,Prod and Default is already there.
variable "instance_type" {
  type = map
  default = {
    default = "t2.micro"
    dev     = "t2.small"
    Prod    = "t2.large"
  }
}
