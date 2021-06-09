
resource "aws_security_group" "ec2_sg" {
  name        = "EC2-SG"
  description = "Default SG for EC2"
  vpc_id      = data.aws_vpc.vpc.id


  ingress {
    description = "Inbound SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2-SG"
  }
}


resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.ec2_sg.id
  network_interface_id = aws_instance.ec2_vm.primary_network_interface_id
}