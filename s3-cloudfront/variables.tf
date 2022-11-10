# S3
variable "bucket_prefix" {
  default = ""
}

# CLOUDFRONT

variable "aliases" {
  type = list
  default = []
}


# AWS
# -----------------------------------------------------------------------------
variable "AWS_ACCESS_KEY" {
  default = ""
}
variable "AWS_SECRET_KEY" {
  default = ""
}
