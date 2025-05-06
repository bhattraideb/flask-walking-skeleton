resource "aws_ecr_repository" "app_repository" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"
  force_delete         = var.force_delete

  image_scanning_configuration {
    scan_on_push = true
  }

  #  lifecycle {
  #    prevent_destroy = true
  #  }
}