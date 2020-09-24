# Create a new load balancer
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAIILHES55MS5MGD5Q"
  secret_key = "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"

}

resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.az

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}
