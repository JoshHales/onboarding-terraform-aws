provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "jh-terraform-state-bucket-432434324"
    key = "aws_tf_remote_state.tfstates"
    region = "eu-west-2"
  }
}

resource "aws_s3_bucket" "jh-terraform-state-bucket" {
  bucket = "jh-terraform-state-bucket-432434324"
}

module "vpc_networking" {
  source = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc_networking.vpc_id
  ec2_instance_type = var.ec2_instance_type
  subnet_id = module.vpc_networking.public_subnet_1a_id
}
