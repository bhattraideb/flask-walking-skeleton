## Internet VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = false
  #  one_nat_gateway_per_az = true
  #  enable_nat_gateway     = true
  #  single_nat_gateway     = true
  #    main_route_table_id = aws_route_table.main_public.id

  tags = {
    Name = var.vpc_name
  }
}

# data "aws_subnets" "subnets" {
#   filter {
#     name   = "vpc-id"
#     values = [aws_vpc.main.id]
#   }
# }
