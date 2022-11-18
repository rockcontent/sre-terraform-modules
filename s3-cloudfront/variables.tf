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
  default = ""
}

variable "product" {
  default = ""
}

variable "tribe" {
  default = ""
}


# AWS
# -----------------------------------------------------------------------------
variable "AWS_ACCESS_KEY" {
  default = ""
}
variable "AWS_SECRET_KEY" {
  default = ""
}

variable "AWS_REGION" {
  default = ""
}
