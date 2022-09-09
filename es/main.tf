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

resource "aws_instance" "es_server1" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t3.small"
  subnet_id = "subnet-0b2baaeaa3a74d851"
  key_name = "nypl_sa2"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]

  tags = {
    Name = "es_server_1"
    Project = "DIY_ES"
  }
}

resource "aws_instance" "es_server2" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t3.small"
  subnet_id = "subnet-0b2baaeaa3a74d851"
  key_name = "nypl_sa2"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]

  tags = {
    Name = "es_server_2"
    Project = "DIY_ES"
  }
}

resource "aws_instance" "es_server3" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t3.small"
  subnet_id = "subnet-0b2baaeaa3a74d851"
  key_name = "nypl_sa2"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]

  tags = {
    Name = "es_server_3"
    Project = "DIY_ES"
  }
}