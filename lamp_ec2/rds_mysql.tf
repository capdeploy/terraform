resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [
    "subnet-012395e7966df0a39",
    "subnet-0b2baaeaa3a74d851"
  ]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  identifier = "terraform-test-db"
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "terraform_mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = ["${aws_security_group.rds_terraform.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.default.id}"
}