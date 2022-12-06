resource "aws_alb_target_group" "main" {
  port        = var.container_port
  protocol    = var.tg_protocol
  vpc_id      = var.vpc
  target_type = "ip"

  health_check {
    interval  = var.tg_interval
    path      = var.tg_path
    timeout   = var.tg_timeout
    matcher   = var.tg_matcher
    healthy_threshold   = var.tg_healthy_threshold
    unhealthy_threshold = var.tg_unhealthy_threshold
  }

  lifecycle {
    create_before_destroy = true
  }
}
