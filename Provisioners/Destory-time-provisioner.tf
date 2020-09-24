resource "aws_instance" "myec2" {
  ami                    = "ami-0e9182bc6494264a4"
  instance_type          = "t2.micro"
  key_name               = "rke"
  vpc_security_group_ids = [aws_security_group.mysec.id]

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo apt-get remove nginx -y"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("./rke.pem")
  }
}

resource "aws_security_group" "mysec" {
  name = "mysecgroup"

  dynamic "ingress" {
    for_each = var.ingress_rules
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
