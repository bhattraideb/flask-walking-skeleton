
output "ecr_repo_url" {
  value = module.app_repo.ecr_repo_url
}

output "ecr_repo_arn" {
  value = module.app_repo.ecr_repo_arn
}

output "ecr_repo_name" {
  value = module.app_repo.ecr_repo_name
}

output "load_balancer_dns_name" {
  value = module.load_balancer.load_balancer_dns_name
}
