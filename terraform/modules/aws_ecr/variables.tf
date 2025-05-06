variable "repository_name" {
  type        = string
  description = "ECR Repository name for Amazon Linux2"
}

variable "force_delete" {
  type        = bool
  description = "Boolean value for force delete for ECR repo. If set it will force to delete image and destroy the repo"
}