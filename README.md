# Terraform Serverless

This module is implementation of serverless architecture.

This is an example of creating AWS serverless resources using terraform in two different approaches:

- basic-serverless
  - Create AWS Lambda function and API Gateway resources using terraform
  - Terraform is organizaed in a way to easily to follow through
  - Each step is prefixed with s{n} in the file name
- module-serverless
  - Each step has its own sub-modules
  - Review https://developer.hashicorp.com/terraform/language/modules/develop for the guide in developing modules
  - Each submodules has its own README.md to show the basic usage

  NOTE:

  Create terraform.tvars according to your needs.
  
 ```
region = "us-east-1"
environment = "dev"
department = "hr"
suffix = "test"
name = "hello-world"
``` 
  