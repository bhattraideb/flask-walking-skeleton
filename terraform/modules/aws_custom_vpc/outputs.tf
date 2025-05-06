output "vpc_id" {
  value = aws_vpc.main.id
}
output "vpc_name" {
  value = aws_vpc.main.tags.Name
}
# output "vpc_subnet_ids" {
#   value = data.aws_subnets.subnets.ids        # [for subnet in aws_subnet : subnet.id]
# }

output "vpc_public_subnets" {
  value = [aws_subnet.main_public, aws_subnet.main_public2]
}

output "vpc_public_subnet_ids" {
  value = [aws_subnet.main_public.id, aws_subnet.main_public2.id]
}

output "vpc_private_subnets" {
  value = [aws_subnet.main_private, aws_subnet.main_private2]
}

output "vpc_private_subnet_ids" {
  value = [aws_subnet.main_private.id, aws_subnet.main_private2.id]
}

output "elastic_ip_id" {
  value = aws_eip.tf_eip.id
}

output "private_a_cidr_block" {
  value = aws_subnet.main_private.cidr_block
}

output "private_b_cidr_block" {
  value = aws_subnet.main_private2.cidr_block
}

output "private_a_subnet_id" {
  value = aws_subnet.main_private.id
}

output "private_b_subnet_id" {
  value = aws_subnet.main_private2.id
}

output "public_a_subnet_id" {
  value = aws_subnet.main_public.id
}

output "public_b_subnet_id" {
  value = aws_subnet.main_public2.id
}

#output "vpc_cidr" {
#  value = aws_vpc.tf_module_vpc.cidr_block
#}

#output "vpc_public_subnets" {
#  # Result is a map of subnet ID to cidr block e.g. {"subnet_1234" => "10.0.0.1.0/4", ....}
#  value = {
#    for subnet in aws_subnet.public :
#    subnet.id => subnet.cidr_block
#  }
#}
#
#
#output "vpc_private_subnets" {
#  # Result is a map of subnet ID to cidr block e.g. {"subnet_1234" => "10.0.0.1.0/4", ....}
#  value = {
#    for subnet in aws_subnet.private :
#    subnet.id => subnet.cidr_block
#  }
#}
