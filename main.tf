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
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-040d909ea4e56f8f3"
  instance_type = "t3.micro"
  #vpc_id = "vpc-d7601abc"
  #subnet_ids = "subnet-3c6cc956"
  #keyfile = "nyplsa"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
