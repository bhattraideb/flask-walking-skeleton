data "aws_region" "current" {}

resource "aws_ecs_cluster" "main" {
  name = "${var.prefix}-${var.app_name}-cluster"
}

resource "aws_ecs_service" "app" {
  name             = "${var.prefix}-${var.app_name}-app"
  cluster          = aws_ecs_cluster.main.name
  task_definition  = aws_ecs_task_definition.main.family
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [aws_security_group.ecs_service_security_group.id]
  }

  load_balancer {
    target_group_arn = var.elb_target_group_arn
    container_name   = "${var.prefix}-${var.app_name}-app"
    container_port   = 5000
  }
}

data "template_file" "app_container_definitions" {
  template = file("${path.module}/templates/ecs/container-definition.json.tpl")

  vars = {
    app_image = var.ecr_image_url
    app_name  = "${var.prefix}-${var.app_name}-app"
    #    proxy_image              = var.ecr_image_url
    #    django_secret_key        = var.django_secret_key
    #    db_host                  = aws_db_instance.main.address
    #    db_name                  = aws_db_instance.main.name
    #    db_user                  = aws_db_instance.main.username
    #    db_pass                  = aws_db_instance.main.password
    log_group_name   = aws_cloudwatch_log_group.ecs_cluster_log_group.name
    log_group_region = data.aws_region.current.name
    allowed_hosts    = var.load_balancer_name
    #    s3_storage_bucket_name   = aws_s3_bucket.app_public_files.bucket
    #    s3_storage_bucket_region = data.aws_region.current.name
  }
}

resource "aws_ecs_task_definition" "main" {
  container_definitions    = data.template_file.app_container_definitions.rendered
  family                   = "${var.prefix}-${var.app_name}-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  task_role_arn            = aws_iam_role.app_iam_role.arn
}
