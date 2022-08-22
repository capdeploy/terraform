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
  ami           = "ami-06a112af5bb8c0acb"
  instance_type = "t3.micro"
  subnet_id = "subnet-0b2baaeaa3a74d851"
  key_name = "nypl_sa2"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]

  tags = {
    Name = "nginx_web_server"
    Project = "TestProject"
  }
}
