# Lambda API Gateway

This module is resposible for creating api gateway and triggering lambda function


## How to use the module?


```hcl
module "lambda_api_gateway" {
  source = "../lambda-api-gateway"
  tags = {
    "key1" = "value1"
    "key2" = "value2"
  }
  include_api_gateway = true
  prefix = "hr-dev"
  name = "hello-world"
  environment = "dev"
  lambda_function_invoke_arn = "123456"
  region = "us-east-1"
}
```

Note the following parameters:

* `prefix`: The prefix to be added to the resource name.

* `include_api_gateway`: true, to create api gateway.

* `name`: The name of resource.

* `tags`: Resource tags.

* `environment`: Env for api gateway deployment.
  
* `lambda_function_invoke_arn`: Lambda function invoke arn.

* `regions`: AWS resources region.

Provided outputs:

* `api_gateway_arn`: The API Gateway arn.
