variable "vpc_id" {
  type = string
  default = "vpc-d7601abc"
}

variable "key_name" {
  type = string
  default = "nyplsa"
}

variable "aws_profile" {
  type = string
  default = "nypl-dev"
}

variable "ec2_ami" {
  type = string
  default = "ami-08d522b64ff954242"
}

variable "ec2_instance_type" {
  type = string
  default = "t3.small"
}

variable "ebs_vol_size" {
  type = string
  default = "50"
}

variable "tag_name" {
  type = string
  default = "bjr-test-kubernetes-cluster"
}

variable "tag_project" {
  type = string
  default = "DevOps"
}

variable "tag_role" {
  type = string
  default = "bjr-test-k8-cluster"
}

variable "ec2_security_group" {
  type = string
  default = "test terraform kubernetes grp"
}