resource "aws_lb_target_group" "instance-tg" {
  name        = var.alb_tg_name
  target_type = var.tg_type
  port        = var.tg_port
  protocol    = var.tg_protocol
  vpc_id      = var.vpc_id
}

# Create a new load balancer
resource "aws_alb" "alb" {
  name               = var.alb_name
  
  subnets = var.public_subnets
  security_groups = ["${aws_security_group.ec2-alb.id}"]


  tags = {
    Name = var.alb_name
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
  certificate_arn   = var.acm_cert

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.instance-tg.arn
  }
}