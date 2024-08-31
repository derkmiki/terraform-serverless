#Module Serverless

This module is implementation of serverless architecture.


```hcl
module "module_serverless" {
  source = "../module-serverless"
  suffix = "test"
  department = "hr"
  name = "hello-world"
  environment = "dev"
  region = "us-east-1"
}
```


Note the following parameters:

* `region`: The region to put AWS resource.
  
* `environment`: The environment name for the AWS resources.

* `department`: The department where resources belongs to.

* `suffix`: Suffix being add to resource name.

* `name`: The resource name.

Provided outputs:

* `invoke_url`: The invoke url of the created lambda's API gateway.

