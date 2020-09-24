resource "aws_instance" "web" {
  ami           = "ami-0e9182bc6494264a4"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.web.private_ip} >> private_ips.txt"
  }
}
