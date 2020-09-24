variable "sg_port" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500]
}

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress for Vault"

  #Here the "ingress" is not something dynamic name its resource property for inbound
  dynamic "ingress" {
    for_each = var.sg_port
    #Using the iterator we can dicard the use of ingress down defined in content block_device
    iterator = port
    content {
      //from_port   = ingress.value
      from_port = port.value
      //to_port     = ingress.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}
