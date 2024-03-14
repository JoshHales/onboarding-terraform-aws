output "session_manager_instance_profile" {
  value = aws_iam_instance_profile.jh_session_manager_instance_profile.name
}

output "iam_access_key_id" {
  description = "The access key ID"
  value       = aws_iam_access_key.iam_access_key.id
}

output "iam_secret_access_key" {
  description = "The secret access key. Sensitive data."
  value       = aws_iam_access_key.iam_access_key.secret
  sensitive   = true
}