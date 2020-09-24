provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAIILHES55MS5MGD5Q"
  secret_key = "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"
}

#This will attach the iterated number along the count parameter
resource "aws_iam_user" "myiam" {
  name = "loadbalancer.${count.index}"
  count = 4
  path = "/system/"
}
