
data "archive_file" "lambda_function_hello_world_zip" {
  type        = "zip"
  source_dir  = "../${path.module}/src"
  output_path = "../${path.module}/${local.function_name}.zip"
}

resource "aws_s3_object" "lambda_function_hello_world_s3_object" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "${local.function_name}.zip"
  source = data.archive_file.lambda_function_hello_world_zip.output_path
  etag   = filemd5(data.archive_file.lambda_function_hello_world_zip.output_path)
}

resource "aws_lambda_function" "lambda_function_hello_world" {
  function_name = "${local.name}-hello-world"
  runtime       = "nodejs20.x"
  handler       = "main.handler"
  role          = aws_iam_role.lambda_role.arn

  s3_bucket        = aws_s3_bucket.lambda_bucket.id
  s3_key           = aws_s3_object.lambda_function_hello_world_s3_object.key
  source_code_hash = data.archive_file.lambda_function_hello_world_zip.output_base64sha256
}

resource "aws_cloudwatch_log_group" "lambda_function_hello_world_cw_group" {
    name = "/aws/lambda/${local.name}-hello-world"
    retention_in_days = 3
}


resource "aws_lambda_permission" "lambda_function_hello_world" {
  statement_id = "AllowAPIGatewayInvoke"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function_hello_world.function_name
  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_rest_api.lambda_api_gateway.execution_arn}/*/*"
}

