module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "2.15.0"

  name                   = "my-cluster"
  instance_count         = 1

  ami                    = "ami-0e9182bc6494264a4"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-447e1008"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
