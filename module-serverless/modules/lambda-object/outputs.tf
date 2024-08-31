output "s3_object_key" {
  value       = aws_s3_object.lambda_object.key
  description = "The object key for the lambda file path."
}

output "source_code_hash" {
  value       = data.archive_file.lambda_object.output_base64sha256
  description = "The hash code for the lambda zip file."
}
