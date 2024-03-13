resource "aws_vpc" "onboarding_exercises_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "jh-onboarding-vpc"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.onboarding_exercises_vpc.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.onboarding_exercises_vpc.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "Private-Subnet-2"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.onboarding_exercises_vpc.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.onboarding_exercises_vpc.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.onboarding_exercises_vpc.id
  tags = {
    "Name" = "Public-Route-Table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.onboarding_exercises_vpc.id
  tags = {
    "Name" = "Private-Route-Table"
  }
}

resource "aws_route_table_association" "public-subnet-1-association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "public-subnet-2-association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnet_2.id
}

resource "aws_route_table_association" "private-subnet-1-association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private_subnet_1.id
}

resource "aws_route_table_association" "private-subnet-2-association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private_subnet_2.id
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.onboarding_exercises_vpc.id

  tags = {
    "Name" = "onboarding-tasks-internet-gateway"
  }
}

resource "aws_route" "internet-gateway-route" {
  route_table_id = aws_route_table.public_route_table.id
  gateway_id = aws_internet_gateway.internet_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_eip" "elastic_ip_for_nat_gw" {
  domain = "vpc"
  tags = {
    Name="Onboarding-Tasks-EIP"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id = aws_subnet.public_subnet_1.id
  allocation_id = aws_eip.elastic_ip_for_nat_gw.id

  tags = {
    "Name" = "Onboarding-Tasks-NAT-GW"
  }
}

resource "aws_route" "nat_gateway_route" {
  route_table_id = aws_route_table.private_route_table.id
  nat_gateway_id = aws_nat_gateway.nat_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}