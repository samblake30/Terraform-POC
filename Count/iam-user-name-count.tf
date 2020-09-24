

variable "elb_name" {
  type = list
  default = ["prod-loadbalancer","stage-loadbalancer","dev-loadbalancer"]
}
#This will attach the iterated number along the count parameter
resource "aws_iam_user" "myiam" {
  name = var.elb_name[count.index]
  count = 3
  path = "/system/"
}
