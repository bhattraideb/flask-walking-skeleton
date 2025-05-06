########### Public Subnets
resource "aws_subnet" "main_public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "main-public"
  }
}

resource "aws_subnet" "main_public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "main-public2"
  }
}

#resource "aws_subnet" "main_public3" {
#  vpc_id                  = aws_vpc.main.id
#  cidr_block              = "10.0.3.0/24"
#  map_public_ip_on_launch = "true"
#  availability_zone       = "us-east-1c"
#
#  tags = {
#    Name = "main-public3"
#  }
#}

############# Private Subnets
resource "aws_subnet" "main_private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "main-private"
  }
}

resource "aws_subnet" "main_private2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "main-private2"
  }
}

#resource "aws_subnet" "main_private3" {
#  vpc_id                  = aws_vpc.main.id
#  cidr_block              = "10.0.6.0/24"
#  map_public_ip_on_launch = "false"
#  availability_zone       = "us-east-1c"
#
#  tags = {
#    Name = "main-private3"
#  }
#}
