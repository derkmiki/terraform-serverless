terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.64.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.5.0"
    }
  }

  required_version = "~> 1.9.2"

  backend "s3" {
    bucket = "terraform-serverless-eaf"
    key    = "dev/aws-lambda/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dev-awslambda"
  }
}

provider "aws" {
  region = var.aws_region
}

