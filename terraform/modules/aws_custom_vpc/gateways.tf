######### Internet Gateway
resource "aws_internet_gateway" "main_internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Main-internet-gateway"
  }
}

######## Elastic IP
resource "aws_eip" "tf_eip" {
  domain = "vpc"
  tags = {
    Name = "Elastic-IP"
  }
}

######## NAT resides in public subnet to allows a private subnet to have access to the Internet,
######## but prevents the Internet from initiating a connection directly to the instances
resource "aws_nat_gateway" "nat_gw_public" {
  allocation_id = aws_eip.tf_eip.id
  subnet_id     = aws_subnet.main_public.id
  #  depends_on    = [aws_internet_gateway.main_internet_gateway]

  tags = {
    Name = "Public-nat-gateway"
  }
}


#resource "aws_network_interface" "public_network_interface" {
#  subnet_id       = aws_subnet.main_public.id
#  private_ips     = ["10.0.0.50"]
#  security_groups = [aws_security_group.web.id]
#
#  attachment {
#    instance     = aws_instance.test.id
#    device_index = 1
#  }
#}
