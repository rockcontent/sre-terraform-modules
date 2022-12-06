# App
#------------------------------------------------------------------------------

variable "app_name" {
  type = string
}

variable "app_tags" {
  type = map
  default = {}
}

variable "app_hostname" {
  type = string
}

# CloudWatch
# -----------------------------------------------------------------------------

variable "cw_logs_retention" {
  type = number
  default = 7
}

variable "cw_logs_region" {
  type = string
  default = "us-east-1"
}

# Container
# -----------------------------------------------------------------------------

variable "container_port" {
  type = number
  default = 8080
}

variable "container_variables" {
  type = list
  default = []
}

# EC2
# -----------------------------------------------------------------------------

variable "cpu" {
  type = number
  default = 1024
}

variable "memory" {
  type = number
  default = 2048
}

variable "min_capacity" {
  type = number
  default = 1
}

variable "max_capacity" {
  type = number
  default = 1
}

variable "vpc" {
  type = string
}

variable "subnets" {
  type = list
  default = []
}

variable "account_id" {
  type = string
}

variable "grace_period" {
  type = number
  default = 0
}

variable "autoscalling_metric_type" {
  type = string
  default = "ECSServiceAverageCPUUtilization"
}

variable "autoscalling_target_value" {
  type = number
  default = 80
}

# Target Group
# -----------------------------------------------------------------------------

variable "tg_protocol" {
  type = string
  default = "HTTP"
}

variable "tg_path" {
  type = string
  default = "/"
}

variable "tg_interval" {
  type = number
  default = 30
}

variable "tg_timeout" {
  type = number
  default = 20
}

variable "tg_matcher" {
  type = string
  default = "200"
}

variable "tg_healthy_threshold" {
  type = number
  default = 2
}

variable "tg_unhealthy_threshold" {
  type = number
  default = 5
}

# Load Balancer
# -----------------------------------------------------------------------------

variable "lb_arn" {
  type = string
}
