provider "aws" {
  region = "us-east-1"
  version = "<= 3.74.3"
}

terraform {
  backend "s3" {}
}


variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "ENVIRONMENT_FILE" {
  type = string
}

variable "SECRETS_FILE" {
  type = string
}


variable "AWS_REGION" {
  type = string
}
variable "AWS_ACCOUNT_ID" {
  type = string
}

variable "PROJECT" {
  type = string
}

variable "BRANCH" {
  type = string
}

variable "CLUSTER_NAME" {
  type = string
}

variable "SUB_DOMAIN" {
  type = string
}

variable "APP_PORT" {
  type = string
}

variable "CPU" {
  type = string
}

variable "MEMORY" {
  type = string
}

variable "METRIC_TYPE" {
  type = string
}

variable "MIN_CAPACITY" {
  type = string
}


variable "MAX_CAPACITY" {
  type = string
}

variable "TARGET_VALUE" {
  type = string
}

variable "TG_INTERVAL" {
  type = string
}

variable "TG_TIMEOUT" {
  type = string
}

variable "TG_PATH" {
  type = string
}

variable "TG_MATCHER" {
  type = string
}

variable "TG_HEALTHY_THRESHOLD" {
  type = string
}

variable "UNHEALTHY_THRESHOLD" {
  type = string
}

variable "LOADBALANCER" {
  type = string
}

variable "SECURITYGROUP" {
  type = string
}

variable "SUBNET1" {
  type = string
}


variable "SUBNET2" {
  type = string
}


variable "VPC" {
  type = string
}


variable "PUBLICIP" {
  type = string
}


variable "LOGSRETENTION" {
  type = string
}


variable "ECRRETENTION" {
  type = string
}


variable "TYPE_COMPATIBILITY" {
  type = string
}


variable "TAG_ENVIRONMENT" {
  type = string
}

variable "TAG_TRIBE" {
  type = string
}

variable "PRODUCT" {
  type = string
}

variable "environment" {
  type = string
  default = null
}

variable "secrets" {
  type = string
  default = null
}

variable "ENVIRONMENTVAR" {
  type = list(any)
  default = []
}
variable "SECRETSVAR" {
  type = list(any)
  default = []
}