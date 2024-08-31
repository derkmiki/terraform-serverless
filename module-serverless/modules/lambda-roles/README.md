# Lambda Roles

This module handles Iam roles and policies attachment for the lambda


## How to use the module?


```hcl
module "lambda_roles" {
  source = "../lambda-roles"
  
  prefix = "121234"
  policy_arn = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
  region = "us-east-1"  
}
```

Note the following parameters:

* `prefix`: The name to be prefix to resource name.
  
* `policy_arn`: The list of managed policy arn to be attahed to the lambda role.

* `regions`: AWS resources region.


Provided outputs:

* `role_arn`: AWS arn of created lambda iam role.

