output "vpc_public_subnet_ids" {
  value = [module.custom_vpc.public_a_subnet_id, module.custom_vpc.public_b_subnet_id]
}
output "database_endpoint" {
  value = module.aws_database_instance.rds_endpoint
}
output "database_name" {
  value = module.aws_database_instance.rds_name
}
output "database_address" {
  value = module.aws_database_instance.rds_address
}
output "database_arn" {
  value = module.aws_database_instance.rds_arn
}
output "database_port" {
  value = module.aws_database_instance.rds_port
}
output "database_username" {
  value = module.aws_database_instance.rds_username
}
output "database_password" {
  value = random_string.password.result
  #   sensitive = true
}
output "database_security_group_id" {
  value = module.aws_database_instance.rds_security_group_id
}
output "database_db_identifier" {
  value = module.aws_database_instance.rds_db_identifier
}
output "database_db_id" {
  value = module.aws_database_instance.rds_db_id
}
output "database_domain" {
  value = module.aws_database_instance.rds_host
}
# output "cluster_endpoint" {
#   value = module.aws_eks_cluster.endpoint
# }
#
# output "kubeconfig-certificate-authority-data" {
#   value = module.aws_eks_cluster.kubeconfig-certificate-authority-data
# }
#
# output "ecr_repo_url" {
#   value = module.aws_ecr_repo.ecr_repo_url
# }
#
# output "ecr_repo_arn" {
#   value = module.aws_ecr_repo.ecr_repo_arn
# }
#
# output "ecr_repo_name" {
#   value = module.aws_ecr_repo.ecr_repo_name
# }
