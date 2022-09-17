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
  default = "ami-09a41e26df464c548"
}

variable "ec2_instance_type" {
  type = string
  default = "t3.medium"
}

variable "ebs_vol_size" {
  type = string
  default = "50"
}

variable "tag_name" {
  type = string
  default = "ashok-test-es"
}

variable "tag_project" {
  type = string
  default = "DevOps"
}

variable "tag_role" {
  type = string
  default = "DEVOPS-ES2"
}

variable "ec2_security_group" {
  type = string
  default = "Ashok terraform ES grp"
}