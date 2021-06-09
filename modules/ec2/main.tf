data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2_vm" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  availability_zone           = "eu-central-1a"
  key_name                    = "aws-ssh-keypair"

  network_interface {
    network_interface_id = aws_network_interface.ec2_nic.id
    device_index         = 0
  }

  tags = {
    Name = "ubuntu-server"
  }
}

data "aws_subnet" "public_subnet_a"{

    tags = {
    Name = "Public Subnet-A"
  }

}

data "aws_vpc" "vpc" {
   
  tags = {
    Name = "VPC-10-0-0-0-16"
  }
}


resource "aws_network_interface" "ec2_nic" {
  subnet_id = data.aws_subnet.public_subnet_a.id
  private_ips = ["10.0.1.100"]

  tags = {
    Name = "ec2_vm_nic"
  }
}


