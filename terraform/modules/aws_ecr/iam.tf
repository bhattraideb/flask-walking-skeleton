resource "aws_ecr_repository_policy" "ecr_repository_policy" {
  repository = aws_ecr_repository.app_repository.name
  policy = jsonencode({
    Version = "2012-10-17"
    "Statement" : [
      {
        "Sid" : "CodeBuildAccessPrincipal",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "codebuild.amazonaws.com"
        },
        "Action" : [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability"
        ]
      },
      {
        "Sid" : "CodeBuildAccessCrossAccount",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::645662440846:root"
        },
        "Action" : [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetAuthorizationToken"
        ]
      }
    ]
  })
}