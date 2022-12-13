resource "spotinst_ocean_ecs" "ecs_spot" {
    region = var.aws_region
    name = var.cluster_name
    cluster_name = var.cluster_name

    min_size         = var.min_size
    max_size         = var.max_size
    desired_capacity = var.desired_capacity

    subnet_ids = var.subnet_ids
    whitelist = var.whitelist

    security_group_ids = var.security_group_ids
    image_id = var.image_id
    iam_instance_profile = var.iam_instance_profile

    key_pair = var.key_pair

    associate_public_ip_address = false
    utilize_reserved_instances  = false
    draining_timeout            = 120
    monitoring                  = false
    ebs_optimized               = false
    use_as_template_only        = false

    spot_percentage     = 100
    utilize_commitments = false


  block_device_mappings {
      device_name = var.device_name
      ebs {
        delete_on_termination = "true"
        encrypted = "true"
        volume_type = "gp2"
        volume_size = var.volume_size
      }
   }
}