data "aws_ami" "vault_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "vaultec2" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.vault_ami.id
  subnet_id              = "subnet-447e1008"
  vpc_security_group_ids = ["sg-091e0eaa6dccf86fe"]
  key_name               = "rke"

  tags = {
    Name = "Vault"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install unzip",
      //"echo 'ubuntu:vaultadmin' | sudo chpasswd",
      "sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config",
      "sudo systemctl restart sshd",
      "sudo wget https://releases.hashicorp.com/vault/1.5.5+ent/vault_1.5.5+ent_linux_amd64.zip && sudo unzip vault_1.5.5+ent_linux_amd64.zip && sudo mv vault /usr/local/bin",
      "export VAULT_ADDR='http://127.0.0.1:8200'"
    ]
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("./rke.pem")
    }
  }

  provisioner "file" {
    source      = "./config.hcl"
    destination = "./config.hcl"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./rke.pem")
      host        = self.public_ip
    }
  }
}

output "awsinstance" {
  value = aws_instance.vaultec2.vpc_security_group_ids
}
