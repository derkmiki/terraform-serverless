variable "region" {
  default = "us-east-1"
  type = string
  description = "The region to put AWS resources."
}

variable "environment" {
  default = "dev"
  type = string
  description = "The environment name for the AWS resources."
}

variable "department" {
  default = "hr"
  type = string
  description = "The department where resources belongs to."
}

variable "suffix" {
  default = "test"
  type = string
  description = "Suffix being add to resource name."
}

variable "name" {
  type = string
  default = "hello-world"
  description = "The resource name."
}

