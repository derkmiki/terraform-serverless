# Lambda Bucket

This module is resposible for creating the s3 object for the lambda function.


## How to use the module?


```hcl
module "lambda_bucket" {
  source = "../lambda-bucket"
  tags = {
    "key1" = "value1"
    "key2" = "value2"
  }
  prefix = "hr-dev"
  suffix = "test"
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restric_public_buckets = true
  region = "us-east-1"
}
```

Note the following parameters:

* `prefix`: The prefix to be added to the lambda bucket.

* `suffix`: The suffix to be added to the lambda bucket.

* `tags`: Resource tags.

* `block_public_acls`: true, to block public ACLs for the bucket.
  
* `block_public_policy`: true, to block public policy for the bucket.

* `ignore_public_acls`: true, to ignore public policy for the bucket.

* `restric_public_buckets`: true, to restrict public buckets for the bucket.

* `regions`: AWS resources region.

Provided outputs:

* `bucket_id`: AWS ID of the created lambda bucket.
