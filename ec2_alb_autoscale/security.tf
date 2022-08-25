resource "aws_security_group" "ec2" {

  name        = var.instances_security_group_name
  description = "Allow HTTP HTTPS SSH"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

    ingress {
    from_port   = 31000
    to_port     = 61000
    protocol    = "tcp"
   # cidr_blocks = "${aws_security_group.ec2-alb.id}"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2-alb" {

  name        = var.alb_security_group_name
  description = "Allow HTTP HTTPS"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

      ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#resource "aws_security_group" "rds_terraform" {
  
 # name        = "Test Terraform RDS Security Grp"
 # description = "Allow MYSQL"
 # vpc_id = var.vpc_id

 # ingress {
 #   from_port   = 3306
 #   to_port     = 3306
 #   protocol    = "tcp"
 #   cidr_blocks = ["10.0.0.0/8"]
 # }

 # egress {
 #   from_port   = 0
 #   to_port     = 0
 #   protocol    = "-1"
 #   cidr_blocks = ["0.0.0.0/0"]
 # }
#}