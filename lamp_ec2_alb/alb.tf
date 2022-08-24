resource "aws_lb_target_group" "instance-tg" {
  name        = "tf-example-lb-instance-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "vpc-04ac4a3b4e0551328"
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.instance-tg.arn
  target_id        = aws_instance.app_server_alb.id
  port             = 80
}

# Create a new load balancer
resource "aws_alb" "alb" {
  name               = "test-terraform-alb"
  
  subnets = [
              "subnet-08603f724f6417fe5",
              "subnet-0071ac6d55c431e43"
  ]
  security_groups = ["${aws_security_group.ec2-alb.id}"]


  tags = {
    Name = "test-terraform-elb"
  }
}

resource "aws_lb_listener" "alb80" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.instance-tg.arn
  }
}
resource "aws_lb_listener" "alb443" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:685731035297:certificate/db3e055b-2182-4fc7-a735-8e8b1b987bf6"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.instance-tg.arn
  }
}