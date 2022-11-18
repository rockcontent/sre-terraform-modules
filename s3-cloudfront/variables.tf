# S3
variable "bucket_prefix" {
  default = "bucket_prefix_value"
}

# CLOUDFRONT

variable "aliases" {
  type = list
  default = []
}

variable "environment" {
  default = "environment_value"
}

variable "product" {
  default = "product_value"
}

variable "tribe" {
  default = "tribe_value"
}


# AWS
# -----------------------------------------------------------------------------
variable "AWS_ACCESS_KEY" {
  default = "aws_access_key_value"
}
variable "AWS_SECRET_KEY" {
  default = "aws_secret_key_value"
}

variable "AWS_REGION" {
  default = "aws_region_value"
}
