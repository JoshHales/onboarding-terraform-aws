output "vpc_id" {
  value = aws_vpc.onboarding_exercises_vpc.id
}

output "public_subnet_1a_id" {
  value = aws_subnet.public_subnet_1.id
}