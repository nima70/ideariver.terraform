resource "aws_iam_role" "ec2_instance_role" {
  name = "ec2_instance_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      },
    ],
  })
}

resource "aws_iam_policy" "ec2_ecr_policy" {
  name        = "ec2_ecr_policy"
  description = "Policy for EC2 instances to access ECR"
  policy      = var.ecr_policy
}

resource "aws_iam_role_policy_attachment" "attach_ecr_policy" {
  role       = aws_iam_role.ec2_instance_role.name
  policy_arn = aws_iam_policy.ec2_ecr_policy.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_instance_role.name
}

output "role_name" {
  value = aws_iam_role.ec2_instance_role.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}

