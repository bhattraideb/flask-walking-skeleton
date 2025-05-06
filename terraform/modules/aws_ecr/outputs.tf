output "ecr_repo_url" {
  value = aws_ecr_repository.app_repository.repository_url
}

output "ecr_repo_arn" {
  value = aws_ecr_repository.app_repository.arn
}

output "ecr_repo_name" {
  value = aws_ecr_repository.app_repository.name
}