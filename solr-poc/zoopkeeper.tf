resource "aws_instance" "zk_server1" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id = "subnet-0b2baaeaa3a74d851"
  key_name = var.key_name
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = var.ebs_vol_size_zk
  }

  tags = {
    Name = var.tag_name
    Project = var.tag_project
    Role = var.tag_role_zk
    ZKID = "1"
  }
}

resource "aws_instance" "zk_server2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id = "subnet-0b2baaeaa3a74d851"
  key_name = var.key_name
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]

    ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = var.ebs_vol_size_zk
  }


  tags = {
    Name = var.tag_name
    Project = var.tag_project
    Role = var.tag_role_zk
    ZKID = "2"
  }
}

resource "aws_instance" "zk_server3" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id = "subnet-0b2baaeaa3a74d851"
  key_name = var.key_name
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]

    ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = var.ebs_vol_size_zk
  }


  tags = {
    Name = var.tag_name
    Project = var.tag_project
    Role = var.tag_role_zk
    ZKID = "3"
  }
}