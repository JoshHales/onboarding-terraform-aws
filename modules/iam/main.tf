resource "aws_iam_role" "jh_ec2_session_manager_role" {
  name = "jh-ec2-session-manager-role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "jh_session_manager_instance_profile" {
  name = "jh-session-manager-instance-profile"
  role = aws_iam_role.jh_ec2_session_manager_role.name
}

resource "aws_iam_user" "iam_user" {
  name = "jh-cli-only-user"
}

resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
  user       = aws_iam_user.iam_user.name
}

resource "aws_iam_access_key" "iam_access_key" {
  user = aws_iam_user.iam_user.name
}