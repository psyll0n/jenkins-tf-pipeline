
resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC-10-0-0-0-16"
  }
}


resource "aws_subnet" "public_subnet_a" {
  cidr_block = var.public_subnet_cidr_a
  vpc_id = "${aws_vpc.vpc.id}"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet-A"
  }
}

resource "aws_subnet" "private_subnet_a" {
  cidr_block = var.private_subnet_cidr_a
  vpc_id = "${aws_vpc.vpc.id}"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "Private Subnet-A"
  }
}

resource "aws_subnet" "public_subnet_b" {
  cidr_block = var.public_subnet_cidr_b
  vpc_id = "${aws_vpc.vpc.id}"
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet-B"
  }
}

resource "aws_subnet" "private_subnet_b" {
  cidr_block = var.private_subnet_cidr_b
  vpc_id = "${aws_vpc.vpc.id}"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "Private Subnet-B"
  }
}

resource "aws_subnet" "public_subnet_c" {
  cidr_block = var.public_subnet_cidr_c
  vpc_id = "${aws_vpc.vpc.id}"
  availability_zone = "eu-central-1c"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet-C"
  }
}

resource "aws_subnet" "private_subnet_c" {
  cidr_block = var.private_subnet_cidr_c
  vpc_id = "${aws_vpc.vpc.id}"
  availability_zone = "eu-central-1c"

  tags = {
    Name = "Private Subnet-C"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "main-rt"
  }
}

resource "aws_route_table_association" "rta-a" {
  subnet_id      = "${aws_subnet.public_subnet_a.id}"
  route_table_id = "${aws_route_table.rt.id}"
}


resource "aws_route_table_association" "rta-b" {
  subnet_id = "${aws_subnet.public_subnet_b.id}"
  route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table_association" "rta-c" {
  subnet_id = "${aws_subnet.public_subnet_c.id}"
  route_table_id = "${aws_route_table.rt.id}"
}

