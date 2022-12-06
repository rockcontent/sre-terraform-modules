# Logs group for container
resource "aws_cloudwatch_log_group" "main" {
  name = "/ecs/${var.app_name}"
  retention_in_days = var.cw_logs_retention
  tags = var.app_tags
}
