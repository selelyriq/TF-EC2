terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data
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

