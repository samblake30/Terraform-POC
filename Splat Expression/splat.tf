resource "aws_iam_user" "lb" {
  name  = "iamuser.${count.index}"
  count = 3
  path  = "/system/"

}

output "arns" {
  //  values = aws_iam_user.lb[0].arn
  //  values = aws_iam_user.lb[1].arn
  //  values = aws_iam_user.lb[2].arn
  # below is * is the splat expression to know all the 3 arn values at once
  value = aws_iam_user.lb[*].arn
}
