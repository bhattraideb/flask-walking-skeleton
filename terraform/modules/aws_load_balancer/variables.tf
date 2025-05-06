variable "prefix" {
  type        = string
  description = "Prefix for resources"
}

variable "load_balancer_type" {
  type        = string
  description = "Load Balancer type, one of  application, gateway, or network"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Subnet IDs of public"
}

#variable "public_b_subnet_id" {
#  type = string
#  description = "Subnet ID of public b"
#}

variable "domain" {
  type        = string
  description = "Domain name for application"
  default     = ""
}

variable "extra_domains" {
  type        = list(string)
  description = "Extra domain names for application"
  default     = []
}

variable "tls" {
  type        = bool
  description = "TLS enabled or not"
  default     = true
}

variable "tls_policy" {
  type        = string
  description = "TLS policy"
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}
