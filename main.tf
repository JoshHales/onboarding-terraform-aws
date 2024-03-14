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

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc_networking.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

#module "ec2_ex1" {
#  source = "./modules/ec2"
#  vpc_id = module.vpc_networking.vpc_id
#  ec2_instance_type = var.ec2_instance_type
#  subnet_id = module.vpc_networking.public_subnet_AZ1_id
#  associate_public_ip_address = true
#  name = "onboarding-tasks-ec2"
#  security_group_id = module.ec2_ex1.security_group_ex1
#}

module "ec2_ex2_AZ1" {
  source = "./modules/ec2"
  associate_public_ip_address = false
  ec2_instance_type = var.ec2_instance_type
  name = "onboarding-ex2-ec2-AZ1"
  security_group_id = module.security_groups.security_group_ex2
  subnet_id = module.vpc_networking.private_subnet_AZ1_id
  iam_instance_profile = module.iam.session_manager_instance_profile

  depends_on = [module.iam, module.security_groups]
}

module "ec2_ex2_AZ2" {
  source = "./modules/ec2"
  associate_public_ip_address = false
  ec2_instance_type = var.ec2_instance_type
  name = "onboarding-ex2-ec2-AZ2"
  security_group_id = module.security_groups.security_group_ex2
  subnet_id = module.vpc_networking.private_subnet_AZ2_id
  iam_instance_profile =  module.iam.session_manager_instance_profile

  depends_on = [module.iam, module.security_groups]
}