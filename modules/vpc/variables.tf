variable "region" {
  description = "Region for deployment"
  default = "eu-west-2"
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