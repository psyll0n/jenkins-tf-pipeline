output vpc_id {
    value = "${aws_vpc.vpc.id}"
}

output igw {
    value = "${aws_internet_gateway.igw.id}"
}

output "public_subnet_a_id" {
    value = "${aws_subnet.public_subnet_a.id}"
}

output "public_subnet_cidr_a" {
    value = "${aws_subnet.public_subnet_a.cidr_block}"
}

output "private_subnet_cidr_a" {
    value = aws_subnet.private_subnet_a.cidr_block
}

output "public_subnet_cidr_b" {
    value = aws_subnet.public_subnet_b.cidr_block
}

output "private_subnet_cidr_b" {
    value = aws_subnet.private_subnet_b.cidr_block
}

output "public_subnet_cidr_c" {
    value = aws_subnet.public_subnet_c.cidr_block
}

output "private_subnet_cidr_c" {
    value = aws_subnet.private_subnet_c.cidr_block
}

