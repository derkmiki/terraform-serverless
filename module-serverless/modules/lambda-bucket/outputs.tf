output "bucket_id" {
  value       = aws_s3_bucket.lambda_bucket.id
  description = "AWS ID of the created lambda bucket."
}
