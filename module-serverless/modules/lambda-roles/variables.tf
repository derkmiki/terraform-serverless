variable "prefix" {
  description = "The name to be prefix to resource name."
  type        = string
}

variable "policy_arn" {
  description = "The list of managed policy arn to be attahed to the lambda role."
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
}

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "AWS resources region."
}
