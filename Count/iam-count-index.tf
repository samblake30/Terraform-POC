
#This will attach the iterated number along the count parameter
resource "aws_iam_user" "myiam" {
  name = "loadbalancer.${count.index}"
  count = 4
  path = "/system/"
}
