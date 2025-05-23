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
# resource "aws_iam_role" "ecs_task_role" {
#   name_prefix = "ecs-task-role-"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         # Action = "ecr:GetAuthorizationToken"
#         Effect = "Allow"
#         Principal = {
#           Service = "ecs-tasks.amazonaws.com"
#         }
#       },
#     ]
#   })
#
#   tags = {
#     Name = "ecs-task"
#   }
# }

resource "aws_iam_role_policy" "ecs_execution_policy" {
          name = "ecs-task-execution-policy"
          role = aws_iam_role.ecs_task_execution_role.id

          policy = jsonencode({
            Version = "2012-10-17"
            Statement = [
              {
                Action = [
                  "ecr:GetAuthorizationToken",
                  "ecr:BatchCheckLayerAvailability",
                  "ecr:DownloadLayerPart",
                  "ecr:GetDownloadURLForLayer",
                  "ecr:GetRepositoryPolicy",
                  "ecr:DescribeRepositories",
                  "ecr:DescribeRegistry",
                  "ecr:ListImages",
                  "ecr:DescribeImage",
                  "ecr:BatchCheckLayerAvailability",
                ],
                Effect = "Allow",
                Resource = "*"
              }
            ]
          })
        }