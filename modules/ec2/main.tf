

resource "aws_instance" "ec2-host" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-12345678"]
  key_name                    = var.key_pair
 
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_device_size
    volume_type           = var.root_device_type
  }
 
  tags = {
    Name = "EC2-Jump-Host"
  }
}
