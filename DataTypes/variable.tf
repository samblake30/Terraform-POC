#this was for datatype.tf file example
variable "usernum" {
  type = number
}


#this is for the ELB resource block
variable "elb_name" {
  type = string
}

variable "az" {
  type = list
}

variable "timeout" {
  type = number
}
