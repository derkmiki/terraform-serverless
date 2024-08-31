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

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "${var.prefix}-lambda-bucket-${var.suffix}"
  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "lambda_bucket" {
  bucket = aws_s3_bucket.lambda_bucket.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restric_public_buckets
}