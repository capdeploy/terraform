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

resource "aws_instance" "app_server" {
  ami           = "ami-040d909ea4e56f8f3"
  instance_type = "t3.micro"
  subnet_id = "subnet-0b2baaeaa3a74d851"
  key_name = "nypl_sa2"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]

  tags = {
    Name = "Test_VPN_Instance"
  }
}
