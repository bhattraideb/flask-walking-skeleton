# IAM Role for ECS Task Execution
resource "aws_iam_role" "ecs_task_execution_role" {
  name_prefix = "ecs-task-execution-role-"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "ecs-task-execution"
  }
}

# IAM Role for ECS Tasks (if your application needs to interact with other AWS services)
resource "aws_iam_role" "ecs_task_role" {
  name_prefix = "ecs-task-role-"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "ecs-task"
  }
}

# Attach the required policy for ECS task execution (pulling images, logging)
resource "aws_iam_policy_attachment" "ecs_task_execution_policy" {
  name = "ecs-task-execution-policy-"
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  roles       = [aws_iam_role.ecs_task_execution_role.name]
}

