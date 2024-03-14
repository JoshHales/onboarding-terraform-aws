output "vpc_id" {
  value = aws_vpc.onboarding_exercises_vpc.id
}

output "public_subnet_AZ1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "private_subnet_AZ1_id" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_AZ2_id" {
  value = aws_subnet.private_subnet_2.id
}