########### Route Tables
resource "aws_route_table" "main_public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_internet_gateway.id
  }

  tags = {
    Name = "public-main-rt"
  }
}

resource "aws_route_table" "main_private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_public.id
  }

  tags = {
    Name = "private-main-rt"
  }
}



########### VPC Main Route Table Association
resource "aws_main_route_table_association" "main_rt_association" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.main_public.id
}

############# public route associations
resource "aws_route_table_association" "main_public_a" {
  subnet_id      = aws_subnet.main_public.id
  route_table_id = aws_route_table.main_public.id
}

resource "aws_route_table_association" "main_public_2a" {
  subnet_id      = aws_subnet.main_public2.id
  route_table_id = aws_route_table.main_public.id
}

#resource "aws_route_table_association" "main_public_3a" {
#  subnet_id      = aws_subnet.main_public3.id
#  route_table_id = aws_route_table.main_public.id
#}

############# private route associations
resource "aws_route_table_association" "main_private_a" {
  subnet_id      = aws_subnet.main_private.id
  route_table_id = aws_route_table.main_private.id
}

resource "aws_route_table_association" "main_private_2a" {
  subnet_id      = aws_subnet.main_private2.id
  route_table_id = aws_route_table.main_private.id
}

#resource "aws_route_table_association" "main_private_3a" {
#  subnet_id      = aws_subnet.main_private3.id
#  route_table_id = aws_route_table.main_private.id
#}