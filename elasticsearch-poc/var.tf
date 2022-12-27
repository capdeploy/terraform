variable "vpc_id" {
  type = string
  default = "vpc-04ac4a3b4e0551328"
}

variable "key_name" {
  type = string
  default = "nypl_sa2"
}

variable "aws_profile" {
  type = string
  default = "nypl-dams-dev"
}

variable "ec2_ami" {
  type = string
  default = "ami-019ade5247094b192"
}

variable "ec2_instance_type" {
  type = string
  default = "t3.large"
}

variable "ebs_vol_size" {
  type = string
  default = "50"
}

variable "tag_name" {
  type = string
  default = "bjr-test-es-cluster"
}

variable "tag_project" {
  type = string
  default = "DevOps"
}

variable "tag_role" {
  type = string
  default = "bjr-test-es-cluster"
}

variable "ec2_security_group" {
  type = string
  default = "test terraform ES grp"
}