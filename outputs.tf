data "aws_caller_identity" "caller_identity" {
}

output "vpc_id" {
  value = module.vpc_networking.vpc_id
}
