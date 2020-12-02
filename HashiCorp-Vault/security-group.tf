resource "aws_security_group_rule" "vaultrule" {
  type              = "ingress"
  from_port         = 8200
  to_port           = 8200
  protocol          = "tcp"
  cidr_blocks       = ["103.251.209.238/32"]
  security_group_id = "sg-091e0eaa6dccf86fe"
}
