variable "prefix" {
  type        = string
  description = "The prefix to be added to the lambda bucket."
}

variable "suffix" {
  type        = string
  description = "The suffix to be added to the lambda bucket."
}

variable "tags" {
  type        = map(string)
  description = "The tag for the resource."
  default     = {}
}

variable "block_public_acls" {
  type        = bool
  description = "true, to block public ACLs for the bucket."
  default     = true
}

variable "block_public_policy" {
  type        = bool
  description = "true, to block public policy for the bucket."
  default     = true
}

variable "ignore_public_acls" {
  type        = bool
  description = "true, to ignore public policy for the bucket."
  default     = true
}

variable "restric_public_buckets" {
  type        = bool
  description = "true, to restrict public buckets for the bucket."
  default     = true
}

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "AWS resources region."
}
