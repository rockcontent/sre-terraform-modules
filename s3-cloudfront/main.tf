terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.75.0"
    }
  }
}

provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY 
}

provider "aws" {
  alias = "virginia"
  region = "us-east-1"
}
