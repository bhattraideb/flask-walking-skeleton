resource "aws_kms_key" "ecs_cluster_kms" {
  description             = "CMK for ECS cluster"
  deletion_window_in_days = 7
}