terraform {
  required_version = "~> 1.9.2"
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
}

provider "aws" {
  region = var.region
}

data "archive_file" "lambda_object" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = "${var.output_path}/${var.filename}.zip"
}

resource "aws_s3_object" "lambda_object" {
  bucket = var.bucket_id
  key    = "${var.filename}.zip"
  source = data.archive_file.lambda_object.output_path
  etag   = filemd5(data.archive_file.lambda_object.output_path)
}
