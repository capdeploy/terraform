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

variable "ec2_instance_type_zk" {
  type = string
  default = "t3.small"
}

variable "ec2_instance_type_sc" {
  type = string
  default = "t3.medium"
}

variable "ebs_vol_size_zk" {
  type = string
  default = "25"
}

variable "ebs_vol_size_sc" {
  type = string
  default = "120"
}

variable "tag_name_zk" {
  type = string
  default = "bjr-test-solr-zk"
}

variable "tag_name_sc" {
  type = string
  default = "bjr-test-solr-sc"
}

variable "tag_project" {
  type = string
  default = "DevOps"
}

variable "tag_role_zk" {
  type = string
  default = "bjr-test-solr-zk"
}

variable "tag_role_sc" {
  type = string
  default = "bjr-test-solr-sc"
}

variable "ec2_security_group" {
  type = string
  default = "NYPL Solr9 Test"
}