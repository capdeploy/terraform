terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = var.aws_profile
  region  = "us-east-1"
}

resource "aws_launch_template" "nginx" {
  name_prefix   = var.launch_template_name
  image_id      = var.image_id
  instance_type = var.intance_type
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  key_name = var.key_name

}

resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier       = var.vpc_zone_identifier
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  target_group_arns = ["${aws_lb_target_group.instance-tg.id}"]

  launch_template {
    id      = aws_launch_template.nginx.id
    version = "$Latest"
  }
}