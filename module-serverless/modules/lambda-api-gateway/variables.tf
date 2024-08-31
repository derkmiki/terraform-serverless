variable "include_api_gateway" {
  type = bool
  description = "To include api gateway for the lambda function/"
}

variable "prefix" {
  type        = string
  description = "The prefix to be added to the resource name."
}

variable "name" {
  type        = string
  description = "The name of resource."
  default = "hello-world"
}

variable "tags" {
  type        = map(string)
  description = "The tag for the resource."
  default     = {}
}

variable "environment" {
  type        = string
  description = "Env for api gateway deployment."
}

variable "lambda_function_invoke_arn" {
 type = string
 description = "Lambda function invoke arn." 
}

variable "region" {
  default = "us-east-1"
  type = string
   description = "AWS resources region." 
}
