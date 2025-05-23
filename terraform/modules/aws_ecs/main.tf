data "aws_region" "current" {}

resource "aws_ecs_cluster" "main" {
  name = "${var.prefix}-${var.app_name}-cluster"
}

resource "aws_ecs_service" "app" {
  name             = "${var.prefix}-${var.app_name}"
  cluster          = aws_ecs_cluster.main.id
  task_definition  = aws_ecs_task_definition.app_task.family
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [aws_security_group.ecs_service_security_group.id]
  }

  load_balancer {
    target_group_arn = var.elb_target_group_arn
    container_name   = "${var.prefix}-${var.app_name}"
    container_port   = 5000
  }
}

# data "template_file" "app_container_definitions" {
#   template = file("${path.module}/templates/ecs/container-definition.json.tpl")
#
#   vars = {
#     app_image = var.ecr_image_url
#     app_name  = "${var.prefix}-${var.app_name}-app"
#     #    proxy_image              = var.ecr_image_url
#     #    django_secret_key        = var.django_secret_key
#     #    db_host                  = aws_db_instance.main.address
#     #    db_name                  = aws_db_instance.main.name
#     #    db_user                  = aws_db_instance.main.username
#     #    db_pass                  = aws_db_instance.main.password
#     log_group_name   = aws_cloudwatch_log_group.ecs_cluster_log_group.name
#     log_group_region = data.aws_region.current.name
#     allowed_hosts    = var.load_balancer_name
#     #    s3_storage_bucket_name   = aws_s3_bucket.app_public_files.bucket
#     #    s3_storage_bucket_region = data.aws_region.current.name
#   }
# }
# CloudWatch Log Group for ECS Task Logs
resource "aws_cloudwatch_log_group" "app_logs" {
  name_prefix       = "/ecs/my-app-"
  retention_in_days = 7

  tags = {
    Name = "ecs-app-logs"
  }
}

resource "aws_ecs_task_definition" "app_task" {
  family                   = "${var.prefix}-${var.app_name}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  # execution_role_arn       = aws_iam_role.task_execution_role.arn
  # task_role_arn = aws_iam_role.ecs_task_role.arn
  # task_role_arn            = aws_iam_role.app_iam_role.arn

  # container_definitions    = data.template_file.app_container_definitions.rendered
  container_definitions = jsonencode([
    {
      name  = "${var.prefix}-${var.app_name}"
      image = "645662440846.dkr.ecr.us-east-1.amazonaws.com/cloud-native-flask-api:latest"    #var.ecr_image_url # "your-dockerhub-username/your-image:your-tag" # Replace with your Docker image details
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000 # In awsvpc network mode, hostPort is not really used but required
          protocol      = "tcp"
        }
      ]
      environment = [
        {
          name  = "ENVIRONMENT"
          value = "production"
        }
        # Add other environment variables as needed
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.app_logs.name
          awslogs-region        = var.aws_region #"your-aws-region" # Replace with your AWS region
          awslogs-stream-prefix = "ecs-app"
        }
      }
    }
  ])

  tags = {
    Name = "${var.prefix}-${var.app_name}"
  }
}
