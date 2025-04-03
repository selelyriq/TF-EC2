terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile = var.iam_instance_profile
  tags          = merge(var.tags, { Name = var.name })
}

resource "aws_eip" "ec2_eip" {
  instance = aws_instance.ec2_instance.id
  tags     = merge(var.tags, { Name = var.name })
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_instance.id
  allocation_id = aws_eip.ec2_eip.id
}

