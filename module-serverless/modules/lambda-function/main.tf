terraform {
  required_version = "~> 1.9.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.64.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_lambda_function" "lambda_function" {
  function_name    = "${var.prefix}-${var.name}"
  runtime          = "nodejs20.x"
  handler          = "main.handler"
  role             = var.lambda_role_arn
  s3_bucket        = var.s3_bucket_id
  s3_key           = var.s3_object_key
  source_code_hash = var.source_code_hash
  tags             = var.tags
}

resource "aws_cloudwatch_log_group" "lambda_function" {
  name              = "/aws/lambda/${var.prefix}-${var.name}"
  retention_in_days = 3
}

