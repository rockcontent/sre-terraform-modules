module "ecs-module" {
  source                  = "./terraform/ecs-ec2"
  project                 = var.PROJECT
  #############################
  #         App config        #
  #############################
  cluster_name            = var.CLUSTER_NAME
  sub_domain              = var.SUB_DOMAIN
  app_port                = var.APP_PORT
  cpu                     = var.CPU
  memory                  = var.MEMORY
  metric_type             = var.METRIC_TYPE
  min_capacity            = var.MIN_CAPACITY
  max_capacity            = var.MAX_CAPACITY
  target_value            = var.TARGET_VALUE
  tg-interval             = var.TG_INTERVAL
  tg-timeout              = var.TG_TIMEOUT
  tg-path	                = var.TG_PATH
  tg-matcher              = var.TG_MATCHER
  tg-healthy_threshold    = var.TG_HEALTHY_THRESHOLD
  tg-unhealthy_threshold  = var.UNHEALTHY_THRESHOLD
  #############################
  #      AWS environment      #
  #############################
  accountid               = var.AWS_ACCOUNT_ID
  region                  = var.AWS_REGION
  loadbalancer            = var.LOADBALANCER
  subnets                 = [
                              var.SUBNET1,
                              var.SUBNET2
                            ]
  publicip                = var.PUBLICIP
  vpc                     = var.VPC
  securitygroup           = var.SECURITYGROUP
  logsretention           = var.LOGSRETENTION
  ecrretention            = var.ECRRETENTION
  type_compatibility      = var.TYPE_COMPATIBILITY
  
  tags = {
    "branch"        = var.BRANCH
    "project"       = var.PROJECT
    "created_by"    = "terraform"
    "tribe"         = var.TAG_TRIBE
    "environment"   = var.TAG_ENVIRONMENT
    "product"       = var.PRODUCT
  }
}
