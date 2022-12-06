# Cluster
resource "aws_ecs_cluster" "main" {
  name = var.cluster_name
  tags = var.cluster_tag
}
