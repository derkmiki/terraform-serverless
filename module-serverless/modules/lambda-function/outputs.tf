output "function_name" {
  value       = aws_lambda_function.lambda_function.function_name
  description = "The lambda function name."
}

output "function_invoke_arn" {
  value       = aws_lambda_function.lambda_function.invoke_arn
  description = "The lambda function invoke arn."
}
