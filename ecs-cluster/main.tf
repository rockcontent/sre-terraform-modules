
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.75.2"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_key_id
}
