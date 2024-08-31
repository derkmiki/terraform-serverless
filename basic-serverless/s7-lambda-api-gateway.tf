resource "aws_api_gateway_rest_api" "lambda_api_gateway" {
  name = "${local.name}-hello-world"
  description = "Rest API gateway for lambda"
}

resource "aws_api_gateway_resource" "lambda_api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.lambda_api_gateway.id
  parent_id = aws_api_gateway_rest_api.lambda_api_gateway.root_resource_id
  path_part = "{proxy+}"
}

resource "aws_api_gateway_method" "lambda_api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.lambda_api_gateway.id
  resource_id = aws_api_gateway_resource.lambda_api_gateway.id
  http_method = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_api_gateway" {
  resource_id = aws_api_gateway_resource.lambda_api_gateway.id
  rest_api_id = aws_api_gateway_rest_api.lambda_api_gateway.id
  http_method = aws_api_gateway_method.lambda_api_gateway.http_method

  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = aws_lambda_function.lambda_function_hello_world.invoke_arn
}

resource "aws_api_gateway_deployment" "lambda_api_gateway" {
  depends_on = [ aws_api_gateway_integration.lambda_api_gateway]
  rest_api_id = aws_api_gateway_rest_api.lambda_api_gateway.id
  stage_name = var.environment
}