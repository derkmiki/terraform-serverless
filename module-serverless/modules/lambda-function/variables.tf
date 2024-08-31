variable "prefix" {
  type        = string
  description = "The prefix to be added to the resource name."
}

variable "name" {
  type        = string
  description = "The name of resource."
  default = "hello-world"
}

variable "lambda_role_arn" {
  type = string
  description = "The lambda role arn."
}

variable "s3_bucket_id" {
  type = string
  description = "The s3 bucket id for the lambda function."
}

variable "tags" {
  type        = map(string)
  description = "The tag for the resource."
  default     = {}
}

variable "s3_object_key" {
  type = string
  description = "The object key for the lambda file path."
}

variable "source_code_hash" {
  type = string
  description = "The source code hash for lambda function."

}

variable "region" {
  default = "us-east-1"
  type = string
   description = "AWS resources region." 
}
