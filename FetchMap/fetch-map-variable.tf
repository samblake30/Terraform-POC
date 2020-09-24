resource "aws_instance" "myec2" {
  ami = "ami-09a7bbd08886aafdf"
  #Uncomment any one of the line to try the scenario
  //  instance_type = var.types["us-west-2"]
  //  instance_type = var.types["ap-south-1"]
  //  instance_type = var.list[0]
  instance_type = var.list[1]
}

output "instancetype" {
  value = aws_instance.myec2
}

variable "list" {
  type    = list
  default = ["m5.large", "m5.xlarge", "t2.medium"]
}

variable "types" {
  type = map
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.nano"
    ap-south-1 = "t2.small"
  }
}
