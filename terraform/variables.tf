variable "managed_by" {
  type        = string
  description = "Project Infrastructure Managed By"
  default     = "Terraform"
}

variable "project" {
  type        = string
  description = "Project name"
  default     = "Kubernetes deployment"
}

variable "owner" {
  type        = string
  description = "Project owner"
  default     = "Deb Bhattrai"
}

variable "environment" {
  type        = string
  description = "Infrastructure description"
  default     = "Development"
}

variable "AWS_REGION" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}

variable "flask_api_repository_name" {
  type        = string
  description = "Flask API repo name deployed from GitHub"
  default     = "kubernetes-flask-api-images"
}

variable "django_api_repository_name" {
  type        = string
  description = "Django API repo name deployed from GitHub"
  default     = "kubernetes-django-api-images"
}

variable "ecs_application_port" {
  type        = string
  description = "Port the Flask APP runs on docker"
  default     = "5000"
}

variable "docker_app_name" {
  type        = string
  description = "Name of Docker App"
  default     = "flask-api"
}
#
# variable "eks_cluster_role_name" {
#   type        = string
#   description = "Role name for EKS"
#   default     = "eks-cluster-role"
# }
#
# variable "eks_cluster_name" {
#   type        = string
#   description = "Cluster name"
#   default     = "flask-api-cluster"
# }
#
# variable "subnet_ids" {
#   type        = list(string)
#   description = "Public subnet IDs of cluster"
#   default     = ["ChangeMe", "ChangeMe"]
# }
######################################################################
############################## DATABASE  #############################
######################################################################
variable "storage" {
  description = "RDS storage in GB"
  default     = 100
}
variable "max_allocated_storage" {
  description = "If greater than storage it will enable storage autoscaling"
  default     = 0
}
variable "engine" {
  description = "RDS engine"
  default     = "postgres"
}
variable "engine_version" {
  description = "RDS engine version"
  default     = "16.3"
}
variable "db_instance_type" {
  description = "RDS instance type"
  default     = "db.t3.small"
}
variable "db_identifier_name" {
  description = "RDS name"
  default     = "postgresql"
}
variable "database_name" {
  description = "RDS database name"
  default     = "PostgresDB"
}
variable "username" {
  description = "RDS username"
  default     = "PgaAminUsr"
}
variable "password_override_special" {
  description = "override special characters used for rds password"
  default     = "!#$%&*()-_=+[]{}<>:?"
  #   sensitive = true
}
variable "set_password" {
  description = "if true, set a random password"
  default     = true
}
variable "multi_az" {
  description = "if true, enable multi-az deployment"
  default     = false
}
variable "storage_type" {
  description = "RDS storage type"
  default     = "gp2"
}
variable "backup_retention_period" {
  description = "RDS backup retention period"
  default     = 0 // Should be some value upto 35 for production
}
variable "iam_database_authentication_enabled" {
  description = "enable iam auth"
  default     = true
}
variable "deletion_protection" {
  description = "Enable Deletion Protection"
  default     = false //Should be true for production
}
variable "encryption_at_rest" {
  description = "enable at rest encryption with KMS"
  default     = true
}
variable "performance_insight_enabled" {
  description = "Enable Performance Insight"
  default     = false
}
variable "engine_family" {
  description = "RDS engine family"
  default     = "postgres16"
}

# variable "private_subnet_ids" {
#   description = "Private subnet ids to launch RDS in"
#   default     = []
# }

variable "parameters" {
  description = "rds parameters to set"
  type = list(object({
    name  = string
    value = string
  }))
  default = [{
    name  = "log_connections"
    value = 1
    }, {
    name  = "character_set_server"
    value = "utf8"
    }, {
    name  = "character_set_client"
    value = "utf8"
  }]
}
variable "ingress_security_groups" {
  description = "Security groups to allow"
  default     = []
}
variable "allow_self" {
  description = "if true, allows traffic from self"
  default     = false
}


