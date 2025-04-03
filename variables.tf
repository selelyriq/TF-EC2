variable "name" {
  type        = string
  description = "The name of the EC2 instance"
}

variable "ami_id" {
  type        = string
  description = "The AMI ID to use for the EC2 instance"
  default = null
}


variable "instance_type" {
  type        = string
  description = "The instance type to use for the EC2 instance"
}


variable "key_name" {
  type        = string
  description = "The key name to use for the EC2 instance"
  default = null
}

variable "user_data" {
  type        = string
  description = "The user data to use for the EC2 instance"
}


variable "tags" {
  type        = map(string)
  description = "The tags to use for the EC2 instance"
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID to use for the EC2 instance"
}

variable "security_group_id" {
  type        = string
  description = "The security group ID to use for the EC2 instance"
}

variable "iam_instance_profile" {
  type        = string
  description = "The IAM instance profile to use for the EC2 instance"
}