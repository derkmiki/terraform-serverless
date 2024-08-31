#Lambda Object

This module is resposible for zipping lambda source and uploading to S3.


## How to use the module?


```hcl
module "lambda_object" {
  source = "../lambda-object"
  
  bucket_id = "121234"
  filename = "hello-world"
  output_path = "/this/is/thepath"
  source_dir =  "this/is/thepath/source"
  region = "us-east-1"  
}
```

Note the following parameters:

* `bucket_id`: AWS S3 Bucket id for which the lambda object will be saved.
  
* `filename`: The name of the lambda object when it is zip, do not include file extension.

* `output_path`: The file path where to save the zip file.
  
* `source_dir`: The directory path where the lambda source is located.

* `regions`: AWS resources region.


Provided outputs:

* `s3_object_key`: The object key for the lambda file path.

* `source_code_hash`: The hash code for the lambda zip file.
