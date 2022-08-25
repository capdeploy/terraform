variable "aws_profile" {
  type = string
  default = "nypl-dams-dev"
}

variable "image_id" {
  type = string
  default = "ami-06a112af5bb8c0acb"
}

variable "intance_type" {
  type = string
  default = "t3.small"
}

variable "key_name" {
  type = string
  default = "nypl_sa2"
}

variable "launch_template_name" {
  type = string
  default = "terraform-nginx-autoscaling"
}

variable "vpc_zone_identifier" {
  type    = list(string)
  default = ["subnet-0b2baaeaa3a74d851", "subnet-079612969c58af055"]
}

variable "vpc_id" {
  type = string
  default = "vpc-04ac4a3b4e0551328"
}

variable "instances_security_group_name" {
  type = string
  default = "Instances Security Grp"
}

variable "alb_security_group_name" {
  type = string
  default = "ALB Security Grp"
}

variable "alb_tg_name" {
  type = string
  default = "nginx-lb-instance-tg"
}

variable "tg_type" {
  type = string
  default = "instance"
}

variable "tg_port" {
  type = string
  default = "80"
}

variable "tg_protocol" {
  type = string
  default = "HTTP"
}

variable "alb_name" {
  type = string
  default = "ngnix-terraform-alb"
}

variable "public_subnets" {
  type    = list(string)
  default = ["subnet-08603f724f6417fe5", "subnet-0071ac6d55c431e43"]
}

variable "acm_cert" {
  type = string
  default = "arn:aws:acm:us-east-1:685731035297:certificate/db3e055b-2182-4fc7-a735-8e8b1b987bf6"
}