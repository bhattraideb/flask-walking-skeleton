# Create an ECS Cluster
resource "aws_ecs_cluster" "flask-api-cluster" {
  name = "flask-api-cluster"
}

# Create a Task Definition
resource "aws_ecs_task_definition" "flask-api-task" {
  family = "flask-api-task"
  network_mode = "awsvpc"
  container_definitions = <<EOF
[
  {
    "name": "flask-api",
    "image": "your_docker_image_name",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80,
        "protocol": "tcp"
      }
    ]
  }
]
EOF
  requires_compatibilities = ["fargate"]
}

# Create an ECS Service
resource "aws_ecs_service" "example" {
  name = "flask-api-service"
  cluster = aws_ecs_cluster.flask-api-cluster.id
  task_definition = aws_ecs_task_definition.flask-api-task.arn
  desired_count = 1
  launch_type = "FARGATE"
  network_configuration {
    subnets        = [aws_subnet.id] # Replace with your subnet IDs
    security_groups = [aws_security_group.example.id] # Replace with your security group ID
  }
  load_balancer {
    target_group_arn = aws_alb_target_group.example.arn # Replace with your target group ARN if using an ALB
    container_name = "my-app"
    container_port = 80
  }
}

# resource "aws_ecs_cluster" "main" {
#   name = "cb-cluster"
# }
#
# data "template_file" "cb_app" {
#   template = file("./templates/ecs/cb_app.json.tpl")
#
#   vars = {
#     app_image      = var.app_image
#     app_port       = var.app_port
#     fargate_cpu    = var.fargate_cpu
#     fargate_memory = var.fargate_memory
#     aws_region     = var.aws_region
#   }
# }
#
# resource "aws_ecs_task_definition" "app" {
#   family                   = "cb-app-task"
#   execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
#   network_mode             = "awsvpc"
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = var.fargate_cpu
#   memory                   = var.fargate_memory
#   container_definitions    = data.template_file.cb_app.rendered
# }
#
# resource "aws_ecs_service" "main" {
#   name            = "cb-service"
#   cluster         = aws_ecs_cluster.main.id
#   task_definition = aws_ecs_task_definition.app.arn
#   desired_count   = var.app_count
#   launch_type     = "FARGATE"
#
#   network_configuration {
#     security_groups  = [aws_security_group.ecs_tasks.id]
#     subnets          = aws_subnet.private.*.id
#     assign_public_ip = true
#   }
#
#   load_balancer {
#     target_group_arn = aws_alb_target_group.app.id
#     container_name   = "cb-app"
#     container_port   = var.app_port
#   }
#
#   depends_on = [aws_alb_listener.front_end, aws_iam_role_policy_attachment.ecs_task_execution_role]
# }