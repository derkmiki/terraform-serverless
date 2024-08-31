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

resource "aws_api_gateway_rest_api" "lambda_api_gateway" {
  count       = var.include_api_gateway ? 1 : 0
  name        = "${var.prefix}-${var.name}"
  description = "Rest API gateway for lambda"
  tags        = var.tags
}

resource "aws_api_gateway_resource" "lambda_api_gateway" {
  count       = var.include_api_gateway ? 1 : 0
  rest_api_id = aws_api_gateway_rest_api.lambda_api_gateway[0].id
  parent_id   = aws_api_gateway_rest_api.lambda_api_gateway[0].root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "lambda_api_gateway" {
  count         = var.include_api_gateway ? 1 : 0
  rest_api_id   = aws_api_gateway_rest_api.lambda_api_gateway[0].id
  resource_id   = aws_api_gateway_resource.lambda_api_gateway[0].id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_api_gateway" {
  count                   = var.include_api_gateway ? 1 : 0
  resource_id             = aws_api_gateway_resource.lambda_api_gateway[0].id
  rest_api_id             = aws_api_gateway_rest_api.lambda_api_gateway[0].id
  http_method             = aws_api_gateway_method.lambda_api_gateway[0].http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_function_invoke_arn
}

resource "aws_api_gateway_deployment" "lambda_api_gateway" {
  count       = var.include_api_gateway ? 1 : 0
  depends_on  = [aws_api_gateway_integration.lambda_api_gateway]
  rest_api_id = aws_api_gateway_rest_api.lambda_api_gateway[0].id
  stage_name  = var.environment
}

resource "aws_lambda_permission" "lambda_api_gateway" {
  count         = var.include_api_gateway ? 1 : 0
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${var.prefix}-${var.name}"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.lambda_api_gateway[0].execution_arn}/*/*"
}

