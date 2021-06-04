resource "aws_vpc" "module_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public_subnet_a" {
  cidr_block = var.public_subnet_cidr_a
  vpc_id = "${aws_vpc.module_vpc.id}"
  tags = {
    Name = "Public Subnet-A"
  }
}

resource "aws_subnet" "private_subnet_a" {
  cidr_block = var.private_subnet_cidr_a
  vpc_id = "${aws_vpc.module_vpc.id}"
  tags = {
    Name = "Private Subnet-A"
  }
}

resource "aws_subnet" "public_subnet_b" {
  cidr_block = var.public_subnet_cidr_b
  vpc_id = "${aws_vpc.module_vpc.id}"
  tags = {
    Name = "Public Subnet-B"
  }
}

resource "aws_subnet" "private_subnet_b" {
  cidr_block = var.private_subnet_cidr_b
  vpc_id = "${aws_vpc.module_vpc.id}"
  tags = {
    Name = "Private Subnet-B"
  }
}

resource "aws_subnet" "public_subnet_c" {
  cidr_block = var.public_subnet_cidr_c
  vpc_id = "${aws_vpc.module_vpc.id}"
  tags = {
    Name = "Public Subnet-C"
  }
}

resource "aws_subnet" "private_subnet_c" {
  cidr_block = var.private_subnet_cidr_c
  vpc_id = "${aws_vpc.module_vpc.id}"
  tags = {
    Name = "Private Subnet-C"
  }
}