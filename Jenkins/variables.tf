variable "instancetype" {
  default = "t2.micro"
}

variable "sgingress_port" {
  type    = list(number)
  default = ["22", "80", "8080"]
}

variable "cidr" {
  default = ["0.0.0.0/0"]
}
