# resource "random_string" "password" {
#   length           = 32
#   special          = true
#   override_special = var.password_override_special
# }
#
module "custom_vpc" {
  source   = "./modules/aws_custom_vpc"
  vpc_name = "my_custom"
}

module "app_repo" {
  source          = "./modules/aws_ecr"
  repository_name = "${var.project}-${var.repository_name}"
  force_delete    = false
}

module "load_balancer" {
  source             = "./modules/aws_load_balancer"
  load_balancer_type = var.load_balancer_type
  prefix             = var.project
  public_subnet_ids  = [module.custom_vpc.public_a_subnet_id, module.custom_vpc.public_b_subnet_id]
  vpc_id             = module.custom_vpc.vpc_id
}

module "ecs" {
  source                          = "./modules/aws_ecs"
  app_name                        = "flask-api"
  ecr_image_url                   = module.app_repo.ecr_repo_url
  elb_target_group_arn            = module.load_balancer.target_group_arn
  load_balancer_name              = module.load_balancer.load_balancer_name
  load_balancer_security_group_id = module.load_balancer.security_group_id
  prefix                          = var.project
  private_subnet_ids              = [module.custom_vpc.private_a_subnet_id, module.custom_vpc.private_b_subnet_id]
  public_subnet_ids               = [module.custom_vpc.public_a_subnet_id, module.custom_vpc.public_b_subnet_id]
  vpc_id                          = module.custom_vpc.vpc_id
  private_cidr_block              = [module.custom_vpc.private_a_cidr_block, module.custom_vpc.private_b_cidr_block]
}
