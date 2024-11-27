### Create IAM policy
resource "aws_iam_policy" "policy" {
  name        = "iam_policy"
  description = "Permissions for EC2"
  policy      = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
            Action: "ec2:*",
            Effect: "Allow",
            Resource: "*"
        }
      ]
    })
}

### Create IAM role
resource "aws_iam_role" "role" {
  name = "iam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "iamrole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

### Attach IAM policy to IAM role
resource "aws_iam_policy_attachment" "policy_attach" {
  name       = "policy_attachment"
  roles      = [aws_iam_role.role.name]
  policy_arn = aws_iam_policy.policy.arn
}

### Create instance profile using role
resource "aws_iam_instance_profile" "profile" {
  name = "profile"
  role = aws_iam_role.role.name
}

### Create EC2 instance and attache IAM role
resource "aws_instance" "instance" {
  instance_type        = "t2.micro"
  ami                  = "ami-0614680123427b75e"
  key_name             = "darling"
  iam_instance_profile = aws_iam_instance_profile.profile.name
}