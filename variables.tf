variable "account_id" {
  type        = "string"
  description = "The Operation AWS Account ID"
}

variable "aws_default_region" {
  type        = "string"
  default     = "us-east-1"
  description = "The AWS region where the resources will be located"
}

variable "profile" {
  type        = "string"
  default     = "default"
  description = "The AWS profile which terraform will use"
}

variable "role_arn" {
  type        = "string"
  description = "The role which terraform will assume in to the AWS accounts"
}

variable "tags" {
  type        = "map"
  description = "A map of tags to add to all resources"
  default     = {}
}