# Create a new load balancer
resource "aws_elb" "elb" {
  name               = "test-terraform-elb-as"
  
  subnets = [
              "subnet-011400a675d566141",
              "subnet-0071ac6d55c431e43"
  ]
  security_groups = ["${aws_security_group.ec2-elb.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:acm:us-east-1:685731035297:certificate/db3e055b-2182-4fc7-a735-8e8b1b987bf6"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  #instances                   = [aws_instance.app_server.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "test-terraform-elb"
  }
}