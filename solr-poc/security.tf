resource "aws_security_group" "ec2" {

  name        = var.ec2_security_group
  description = "Allow SSH SOLR Ports"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

    ingress {
    from_port   = 2183
    to_port     = 2183
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

    ingress {
    from_port   = 8983
    to_port     = 8983
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

    ingress {
    from_port   = 2888
    to_port     = 2888
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

    ingress {
    from_port   = 3888
    to_port     = 3888
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}