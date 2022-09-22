# Create a new load balancer
resource "aws_elb" "elb" {
  name               = var.elb_name
  
  subnets = [
              "subnet-08603f724f6417fe5",
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
    target              = "HTTP:8983/solr"
    interval            = 30
  }

  instances                   = [aws_instance.sc_server1.id, aws_instance.sc_server2.id, aws_instance.sc_server3.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "sc-terraform-elb"
  }
}