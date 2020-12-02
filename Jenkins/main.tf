data "aws_ami" "myami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20201026"]
  }
}

resource "aws_instance" "jenkinsec2" {
  ami                    = data.aws_ami.myami.id
  instance_type          = var.instancetype
  key_name               = "rke"
  vpc_security_group_ids = [aws_security_group.jenkinssecgrp.id]

  tags = {
    Name = "Jenkins-Instance"
  }

  provisioner "remote-exec" {
    on_failure = fail
    inline = [
      "sudo apt-get update && sudo apt-get upgrade -y",
      "sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -",
      "sudo sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
      "sudo apt-get install -y openjdk-8-jre",
      "sudo apt-get update",
      "sudo apt-get install jenkins -y"
      //"sudo apt-get install java-1.8.0-openjdk.x86_64 wget -y",
      //"sudo wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war "
    ]
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = file("../../Terraform-Instance/datafile/rke.pem")
    }
  }
}
