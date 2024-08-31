# Lambda function

This module is resposible for creating the lambda function.


## How to use the module?


```hcl
module "lambda_function" {
  source = "../lambda-function"
  tags = {
    "key1" = "value1"
    "key2" = "value2"
  }
  prefix = "hr-dev"
  name = "hello-world"
  lambda_role_arn = "123456"
  s3_bucket_id = "123456"
  s3_object_key = "123456"
  source_code_hash = "123456"  
  region = "us-east-1"  
}
```

Note the following parameters:

* `prefix`: The prefix to be added to the resource name.
* 
* `name`: The name of resource.

* `tags`: Resource tags.

* `lambda_role_arn`: The lambda role arn.
  
* `s3_bucket_id`: The s3 bucket id for the lambda function.

* `s3_object_key`: The object key for the lambda file path.

* `source_code_hash`: The source code hash for lambda function.

* `regions`: AWS resources region.

Provided outputs:

* `function_name`: The lambda function name.

* `function_invoke_arn`: The lambda function invoke arn.
