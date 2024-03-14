variable "ec2_instance_type" {
  description = "type of instance"
}

variable "subnet_id" {
  description = "id for public subnet 1a "
}

variable "security_group_id" {
  description = "id for security group"
}

variable "associate_public_ip_address" {
  description = "Bool that defines if ec2 instance has a public ip attached"
  type = bool
}

variable "name" {
  description = "name of ec2 instance"
}

variable "iam_instance_profile" {
  description = "iam role to attach to instance"
}