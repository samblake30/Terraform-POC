output "awsinstanceip" {
  value = aws_instance.jenkinsec2.public_ip
}
