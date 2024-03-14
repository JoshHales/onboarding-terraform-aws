resource "aws_security_group" "security_group_ex1" {
  name = "ex1-allow-ssh"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["90.216.150.193/32"]
  }
 egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "security_group_ex2" {
  name = "ex2-ec2-connect"
  vpc_id = var.vpc_id

  ingress {
    from_port = 8
    protocol  = "icmp"
    to_port   = -1
    self = true
  }
   egress {
      from_port = 0
      protocol  = "-1"
      to_port   = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
}