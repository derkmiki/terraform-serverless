terraform {
    required_version = "~> 1.9.2"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.64.0"
      }
    }
}


provider "aws" {
  region = var.region
}

resource "aws_iam_role" "lambda_role" {
  name = "${var.prefix}-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_role" {
  role       = aws_iam_role.lambda_role.name
  for_each = toset(var.policy_arn)
  policy_arn = each.value
}
