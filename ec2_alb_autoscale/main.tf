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
  profile = "nypl-dams-dev"
  region  = "us-east-1"
}

resource "aws_launch_template" "nginx" {
  name_prefix   = "terraform-nginx-autoscaling"
  image_id      = "ami-06a112af5bb8c0acb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  key_name = "nypl_sa2"

}

resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier       = ["subnet-0b2baaeaa3a74d851", "subnet-079612969c58af055"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  target_group_arns = ["${aws_lb_target_group.instance-tg.id}"]

  launch_template {
    id      = aws_launch_template.nginx.id
    version = "$Latest"
  }
}