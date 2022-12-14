# S3
variable "bucket_prefix" {
  default = ""
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

#ACM

variable "ACM_CERTIFICATE" {
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
