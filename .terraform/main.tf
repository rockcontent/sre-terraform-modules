terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.13.0"
    }
  }
}

provider "aws" {
  region = lookup(var.region_mapping, var.BRANCH)
}

variable "PROJECT" {
  type = string
}

variable "BRANCH" {
  type = string
}

#############################
#    App config var map     #
#############################
variable "sub_domain_mapping" {
  description = "mapping subdomains for branch"
  default = {
    "master" = "reports.ion.rockcontent.com",
    "staging" = "reports-dev.ion.rockcontent.com",
    "develop" = "reports-dev.ion.rockcontent.com",
  }
}

variable "cpu_mapping" {
  description = "mapping cpu for each branch"
  default = {
    "master"  = 256,
    "staging" = 256,
    "develop" = 256
  }
}
variable "memory_mapping" {
  description = "mapping memory for each branch"
  default = {
    "master"  = 512,
    "staging" = 512,
    "develop" = 512
  }
}
variable "min_capacity_mapping" {
  description = "mapping min capacity for each branch"
  default = {
    "master"  = 1,
    "staging" = 1,
    "develop" = 1
  }
}
variable "max_capacity_mapping" {
  description = "mapping max capacity for each branch"
  default = {
    "master"  = 1,
    "staging" = 1,
    "develop" = 1
  }
}

#############################
#  AWS environment var map  #
#############################
# Select region of each branch
variable "region_mapping" {
  description = "mapping region for branch"
  default = {
    "master"  = "us-east-1",
    "staging" = "us-east-1",
    "develop" = "us-east-1",
  }
}
variable "loadbalancer_mapping" {
  description = "mapping loadbalancer for branch"
  default = {
    "master"  = "arn:aws:elasticloadbalancing:us-east-1:508951411993:listener/app/ion-dev-ecs-pub/cdacbfc944d694a6/10b86ece6baa9b12",
    "staging" = "arn:aws:elasticloadbalancing:us-east-1:508951411993:listener/app/ion-dev-ecs-pub/cdacbfc944d694a6/10b86ece6baa9b12",
    "develop" = "arn:aws:elasticloadbalancing:us-east-1:508951411993:listener/app/ion-dev-ecs-pub/cdacbfc944d694a6/10b86ece6baa9b12"
  }
}
variable "subnet1_mapping" {
  description = "mapping subnet 1 for branch"
  default = {
    "master"  = "subnet-09db3c2ca113a3d90",
    "staging" = "subnet-09db3c2ca113a3d90",
    "develop" = "subnet-09db3c2ca113a3d90"
  }
}
variable "subnet2_mapping" {
  description = "mapping subnet 2 for branch"
  default = {
    "master"  = "subnet-0ebf909719ea32619",
    "staging" = "subnet-0ebf909719ea32619",
    "develop" = "subnet-0ebf909719ea32619"
  }
}
variable "vpc_mapping" {
  description = "mapping vpc for branch"
  default = {
    "master"  = "vpc-0c7eac311cde05600",
    "staging" = "vpc-0c7eac311cde05600",
    "develop" = "vpc-0c7eac311cde05600"
  }
}
variable "sg_mapping" {
  description = "mapping securitygroup for branch"
  default = {
    "master"  = "sg-09ff4a25dfbb15acf",
    "staging" = "sg-09ff4a25dfbb15acf",
    "develop" = "sg-09ff4a25dfbb15acf"
  }
}
variable "logsretention_mapping" {
  description = "mapping logs retetion period for branch (days)"
  default = {
    "master"  = 3,
    "staging" = 1,
    "develop" = 1
  }
}
variable "ecrretention_mapping" {
  description = "mapping logs retetion period for branch (days)"
  default = {
    "master"  = 3,
	  "staging" = 1,
    "develop" = 1
  }
}
variable "accountid_mapping" {
  description = "mapping logs retetion period for branch (days)"
  default = {
    "master"  = 508951411993,
	  "staging" = 508951411993,
    "develop" = 508951411993
  }
}
variable "type_compatibility_mapping" {
  description = "mapping logs retetion period for branch (days)"
  default = {
    "master"  = "FARGATE",
    "staging" = "FARGATE",
    "develop" = "FARGATE"
  }
}

module "ecs-module" {
  source                  = "./devops-terraform-ecs"
  project                 = lower(var.PROJECT)
  #############################
  #         App config        #
  #############################
  sub_domain              = "${lookup(var.sub_domain_mapping, var.BRANCH)}"
  app_port                = 80
  cpu                     = "${lookup(var.cpu_mapping, var.BRANCH)}"
  memory                  = "${lookup(var.memory_mapping, var.BRANCH)}"
  metric_type             = "ECSServiceAverageCPUUtilization" # ECSServiceAverageMemoryUtilization
  min_capacity            = "${lookup(var.min_capacity_mapping, var.BRANCH)}"
  max_capacity            = "${lookup(var.max_capacity_mapping, var.BRANCH)}"
  target_value            = 80
  tg-interval             = 30
  tg-timeout              = 5
  tg-path	                = "/"
  tg-matcher              = "200-404"
  tg-healthy_threshold    = 5
  tg-unhealthy_threshold  = 2
  #############################
  #      AWS environment      #
  #############################
  accountid               = var.AWS_ACCOUNT_ID
  region                  = "${lookup(var.region_mapping, var.BRANCH)}"
  loadbalancer            = "${lookup(var.loadbalancer_mapping, var.BRANCH)}"
  subnets                 = [
                              "${lookup(var.subnet1_mapping, var.BRANCH)}",
                              "${lookup(var.subnet2_mapping, var.BRANCH)}"
                            ]
  publicip                = "true"
  vpc                     = "${lookup(var.vpc_mapping, var.BRANCH)}"
  securitygroup           = "${lookup(var.sg_mapping, var.BRANCH)}"
  logsretention           = "${lookup(var.logsretention_mapping, var.BRANCH)}"
  ecrretention            = "${lookup(var.ecrretention_mapping, var.BRANCH)}"
  type_compatibility      = "${lookup(var.type_compatibility_mapping, var.BRANCH)}"
  
  tags = {
    "Branch" = var.BRANCH
    "Cost Center" = "ION Reports API"
    "Project"     = var.PROJECT
    "Created by"     = "Terraform"
    "Tribe"       = "ION Reports API"
    "Environment" = var.BRANCH
  }

  # task_environment = [
  #   # env
  #   {"name"="ASPNETCORE_ENVIRONMENT","value"=var.ASPNETCORE_ENVIRONMENT},

  #   # mongo
  #   {"name"="MONGO__DATABASE","value"=var.MONGO__DATABASE},
  #   {"name"="MONGO__USERNAME","value"=var.MONGO__USERNAME},
  #   {"name"="MONGO__HOST","value"=var.MONGO__HOST},
  #   {"name"="MONGO__CERTFILE","value"=var.MONGO__CERTFILE},

  #   # APIs
  #   {"name"="ROCKSSO__URL","value"=var.ROCKSSO__URL},
  #   {"name"="GTN__AUTHTOKEN","value"=var.GTN__AUTHTOKEN},
  #   {"name"="WORKFLOW__AUTHTOKEN","value"=var.WORKFLOW__AUTHTOKEN},
  #   {"name"="MARKETPLACE__AUTHTOKEN","value"=var.MARKETPLACE__AUTHTOKEN},
  #   {"name"="ROCK_SUITE__AUTHTOKEN","value"=var.ROCK_SUITE__AUTHTOKEN},    
  #   {"name"="APIS__NOTIFICATION__AUTHTOKEN","value"=var.APIS__NOTIFICATION__AUTHTOKEN},
  #   {"name"="SENTRY__DSN","value"=var.SENTRY__DSN},
  # ]
  # task_secret = [
  #   {"name"="MONGO__PASSWORD","valueFrom"=var.MONGO__PASSWORD}
  # ]
}
