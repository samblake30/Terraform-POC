resource "aws_instance" "myec21" {
  ami                    = "ami-0e9182bc6494264a4"
  //instance_type          = "t2.small"
  #To use variable in module
  instance_type = var.instance_type
  key_name               = "rke"
  security_groups = ["default"]
}
