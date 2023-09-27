resource "aws_vpc" "primus-vpc" {
  cidr_block           = var.vpc-cidr # "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "primus-vpc"
  }

}

resource "aws_subnet" "primus-aws_subnet" {
  vpc_id                  = aws_vpc.primus-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.avzone
  map_public_ip_on_launch = true
  tags = {
    Name = "primus-sbn"
  }

}

resource "aws_internet_gateway" "primus-igw" {
  vpc_id = aws_vpc.primus-vpc.id
  tags = {
    Name = "primus-igw"
  }

}


resource "aws_route_table" "primus-rt" {
  vpc_id = aws_vpc.primus-vpc.id

  tags = {
    Name = "primus-rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.primus-igw.id
  }
}

resource "aws_route_table_association" "primus-table" {
  subnet_id      = aws_subnet.primus-aws_subnet.id
  route_table_id = aws_route_table.primus-rt.id
}



  





