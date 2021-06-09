module "networking" {
  source                = "./modules/networking"
  public_subnet_cidr_a  = var.public_subnet_cidr_a
  private_subnet_cidr_a = var.private_subnet_cidr_a
  public_subnet_cidr_b  = var.public_subnet_cidr_b
  private_subnet_cidr_b = var.private_subnet_cidr_b
  public_subnet_cidr_c  = var.public_subnet_cidr_c
  private_subnet_cidr_c = var.private_subnet_cidr_c
}


resource "aws_instance" "ubuntu" {
  key_name               = "aws-ssh-keypair"
  ami                    = "ami-043097594a7df80ec"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  
  depends_on  = [aws_security_group.sg]
  tags = {
    Name = "Ubuntu-JumpBox"
  }

  associate_public_ip_address = true


  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 10
  }
}


resource "aws_security_group" "sg" {
  name        = "main-sg"
  description = "Default SG for EC2"


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
    Name = "Main-SG"
  }
}

