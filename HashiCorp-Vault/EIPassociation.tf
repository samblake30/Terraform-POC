resource "aws_eip" "vaultip" {
  vpc = true
}

resource "aws_eip_association" "vaulteip" {
  instance_id   = aws_instance.vaultec2.id
  allocation_id = aws_eip.vaultip.id
}

output "awseip" {
  value = aws_eip_association.vaulteip.public_ip
}
