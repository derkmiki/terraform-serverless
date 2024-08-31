terraform {
  required_version = "~> 1.9.2"

  backend "s3" {
    bucket = "terraform-serverless-eaf"
    key    = "dev/aws-lambda-module/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-awslambda-module"
  }

}

locals {
  prefix = "${var.department}-${var.environment}"
  tags = {
    deparment   = var.department
    environment = var.environment
  }
  output_path = "../${path.module}"
  source_dir = "../${path.module}/src"
}

# create the lambda bucket
module "lambda_bucket" {
  source                 = "./modules/lambda-bucket"
  tags                   = local.tags
  prefix                 = local.prefix
  suffix                 = var.suffix
  block_public_acls      = true
  block_public_policy    = true
  ignore_public_acls     = true
  restric_public_buckets = true
  region                 = var.region
}

# upload the lambda object
module "lambda_object" {
  source      = "./modules/lambda-object"
  bucket_id   = module.lambda_bucket.bucket_id
  filename    = "${local.prefix}-${var.name}"
  output_path = local.output_path
  source_dir  = local.source_dir
  region      = var.region
}

# create roles for lambda
module "lambda_roles" {
  source     = "./modules/lambda-roles"
  prefix     = local.prefix
  policy_arn = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
  region     = var.region
}

# create the lambda function
module "lambda_function" {
  source           = "./modules/lambda-function"
  tags             = local.tags
  prefix           = local.prefix
  name             = var.name
  lambda_role_arn  = module.lambda_roles.role_arn
  s3_bucket_id     = module.lambda_bucket.bucket_id
  s3_object_key    = module.lambda_object.s3_object_key
  source_code_hash = module.lambda_object.source_code_hash
  region           = var.region
}


# attached gateway
module "lambda_api_gateway" {
  source                     = "./modules/lambda-api-gateway"
  tags                       = local.tags
  include_api_gateway        = true
  prefix                     = local.prefix
  name                       = var.name
  environment                = var.environment
  lambda_function_invoke_arn = module.lambda_function.function_invoke_arn
  region                     = var.region
}
