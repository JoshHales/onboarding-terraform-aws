resource "aws_security_group" "security_group" {
  name = "ex1-allow-ssh"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["90.216.150.192/32"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jh-onboarding-ec2-instance" {
  ami = "ami-09885f3ec1667cbfc"
  instance_type = var.ec2_instance_type
  key_name = "jh-onboarding-keys"
  security_groups = [aws_security_group.security_group.id]
  subnet_id = var.subnet_id
  associate_public_ip_address = true
   tags = {
    "Name" = "onboarding-tasks-ec2"
  }
}