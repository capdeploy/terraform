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
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  key_name = "nypl_sa2"

}

resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier       = ["subnet-0b2baaeaa3a74d851", "subnet-012395e7966df0a39"]
  desired_capacity   = 2
  max_size           = 2
  min_size           = 1
  load_balancers = ["${aws_elb.elb.id}"]

  launch_template {
    id      = aws_launch_template.nginx.id
    version = "$Latest"
  }
}