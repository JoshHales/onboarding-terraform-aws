resource "aws_instance" "jh-onboarding-ec2-instance" {
  ami = "ami-09885f3ec1667cbfc"
  instance_type = var.ec2_instance_type
  key_name = "jh-onboarding-keys"
  security_groups = [var.security_group_id]
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  iam_instance_profile = var.iam_instance_profile
   tags = {
    "Name" = var.name
  }
}