output "vpc_id" {
    value = aws_vpc.module_vpc.id
}

output "vpc_cidr" {
    value = aws_vpc.module_vpc.cidr_block
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

output "aws_internet_gateway" {
    value = aws_internet_gateway.gw.id
}

output "aws_route_table" {
    value = aws_route_table.rt.id
}

output "aws_security_group" {
    value = aws_security_group.sg.id
}