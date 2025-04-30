resource "random_string" "password" {
  length           = 32
  special          = true
  override_special = var.password_override_special
}

module "custom_vpc" {
  source      = "git::https://gitlab.com/bhattraideb/aws-terraform-modules.git//modules/aws_custom_vpc?ref=main"
  environment = var.environment
}

module "flask_repo" {
  source          = "git::https://gitlab.com/bhattraideb/aws-terraform-modules.git//modules/aws_ecr?ref=main"
  repository_name = var.flask_api_repository_name
}

