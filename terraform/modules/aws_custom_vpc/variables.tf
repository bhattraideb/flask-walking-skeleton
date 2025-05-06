variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}
variable "vpc_cidr_block" {
  type        = string
  description = "The IP range to use for VPC"
  default     = "10.0.0.0/16"
}


# variable "public_subnet_numbers" {
#   type        = map(number)
#   description = "Map of AZ to a number that should be used for public subnets"
#   default = {
#     "us-east-1a" = 1
#     "us-east-1b" = 2
# #    "us-east-1c" = 3
# #    "us-east-1d" = 4
# #    "us-east-1e" = 5
#   }
# }
#
# variable "private_subnet_numbers" {
#   type        = map(number)
#   description = "Map of AZ to a number that should be used for private subnets"
#   default = {
#     "us-east-1a" = 6
#     "us-east-1b" = 7
# #    "us-east-1c" = 8
# #    "us-east-1d" = 9
# #    "us-east-1e" = 10
#   }
# }