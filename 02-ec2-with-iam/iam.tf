resource "aws_iam_role" "ec2_role" {
  name = "example-ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_policy" "ec2_policy" {
  name        = "example-ec2-policy"
  description = "Policy to allow EC2 to list S3 buckets"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["s3:ListAllMyBuckets"]
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

# This here connects the role and policy created above.
resource "aws_iam_role_policy_attachment" "attach_role_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "example-ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}
