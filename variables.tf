variable "vpc" {
  default = {}
}

variable "vpc_cidr_block" {
  description = "cidr block for VPC"
}

variable "private_subnet_1_cidr" {
  description = "cidr block for private subnet 1"
}

variable "private_subnet_2_cidr" {
  description = "cidr block for private subnet 2"
}

variable "public_subnet_1_cidr" {
  description = "cidr block for public subnet 1"
}

variable "public_subnet_2_cidr" {
  description = "cidr block for public subnet 2"
}

variable "ec2_instance_type" {
  description = "type of instance"
}