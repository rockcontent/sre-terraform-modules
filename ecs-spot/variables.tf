# ECS Cluster
#------------------------------------------------------------------------------

variable "cluster_name" {
  default = ""
}

# ECS Instance
#------------------------------------------------------------------------------

variable "image_id" {
  default = ""
}

# variable "iam_instance_profile" {
#   default = ""
# }

# variable "key_pair" {
#   default = ""
# }

# ECS AutoScaling
#------------------------------------------------------------------------------

# variable "min_size" {
#   default = "0"
# }

# variable "max_size" {
#   default = "0"
# }

variable "desired_capacity" {
  default = 1
}

# variable "whitelist" {
#   default = []
# }

# ECS Network
#------------------------------------------------------------------------------

variable "subnet_ids" {
    type    = list(string)
    default = []
}

variable "security_group_ids" {
    type    = list(string)
    default = []
}


# ECS Block Device Mapping
#------------------------------------------------------------------------------

variable "device_name" {
  default = "/dev/xvda"
}

variable "volume_size" {
  default = 20
}

# AWS
#------------------------------------------------------------------------------

variable "aws_region" {
  default = ""
}

variable "aws_access_key_id" {
  default = ""
}

variable "aws_secret_key_id" {
  default = ""
}

# SPOTINST
#------------------------------------------------------------------------------

variable "spotinst_token" {
  default = ""
}

variable "spotinst_account" {
  default = ""
}

