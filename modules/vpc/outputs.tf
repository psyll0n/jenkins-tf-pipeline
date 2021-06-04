output "vpc_id" {
    value = aws_vpc.vpc_module.cidr_block
}

output "vpc_cidr" {
    value = aws_vpc.vpc_module.cidr_block
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
