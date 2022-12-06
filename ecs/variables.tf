# ECS Cluster
#------------------------------------------------------------------------------

variable "cluster_name" {
  type = string
}

variable "cluster_tag" {
  type = map
  default = {}
}