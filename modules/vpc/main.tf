
resource "aws_vpc" "module_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public_subnet_a" {
  cidr_block = var.public_subnet_cidr_a
  vpc_id = "${aws_vpc.module_vpc.id}"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = "true"


  tags = {
    Name = "Public Subnet-A"
  }
}

resource "aws_subnet" "private_subnet_a" {
  cidr_block = var.private_subnet_cidr_a
  vpc_id = "${aws_vpc.module_vpc.id}"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "Private Subnet-A"
  }
}

resource "aws_subnet" "public_subnet_b" {
  cidr_block = var.public_subnet_cidr_b
  vpc_id = "${aws_vpc.module_vpc.id}"
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet-B"
  }
}

resource "aws_subnet" "private_subnet_b" {
  cidr_block = var.private_subnet_cidr_b
  vpc_id = "${aws_vpc.module_vpc.id}"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "Private Subnet-B"
  }
}

resource "aws_subnet" "public_subnet_c" {
  cidr_block = var.public_subnet_cidr_c
  vpc_id = "${aws_vpc.module_vpc.id}"
  availability_zone = "eu-central-1c"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet-C"
  }
}

resource "aws_subnet" "private_subnet_c" {
  cidr_block = var.private_subnet_cidr_c
  vpc_id = "${aws_vpc.module_vpc.id}"
  availability_zone = "eu-central-1c"

  tags = {
    Name = "Private Subnet-C"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.module_vpc.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.module_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
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



resource "aws_security_group" "sg" {
  name        = "main-sg"
  description = "Default SG for the 10.0.0.0/16 VPC"
  vpc_id      = aws_vpc.module_vpc.id

  ingress {
    description      = "Inbound SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Main-SG"
  }
}