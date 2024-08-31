variable "bucket_id" {
  type        = string
  description = "AWS S3 Bucket id for which the lambda object will be saved."
}

variable "filename" {
  type        = string
  description = "The name of the lambda object when it is zip, do not include file extension."
}

variable "output_path" {
  type        = string
  description = "The file path where to save the zip file."
}

variable "source_dir" {
  type        = string
  description = "The directory path where the lambda source is located."
}


variable "region" {
  default     = "us-east-1"
  type        = string
  description = "AWS resources region."
}
