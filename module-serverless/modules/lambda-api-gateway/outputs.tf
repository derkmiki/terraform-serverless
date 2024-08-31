output "api_gateway_arn" {
  value = aws_api_gateway_rest_api.lambda_api_gateway[0].arn
  description = "The API Gateway arn."
}

output "invoke_url" {
  value = aws_api_gateway_deployment.lambda_api_gateway[0].invoke_url
}