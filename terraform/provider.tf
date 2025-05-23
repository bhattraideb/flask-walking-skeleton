### Configure the AWS Provider
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.11"
    }
  }
}

provider "aws" {
  region  = var.AWS_REGION
  profile = "tf-user-for-test"
  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project
      Owner       = var.owner
      ManagedBy   = var.managed_by
    }
  }
}
