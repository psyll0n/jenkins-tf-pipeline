output vpc_id {
    value = "${aws_vpc.vpc.id}"
}

output "public_subnet_cidr_a" {
    value = aws_subnet.public_subnet_a.cidr_block
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

output "sg_id" {
    value = "${aws_security_group.sg.id}"
}
