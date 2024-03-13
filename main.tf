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
