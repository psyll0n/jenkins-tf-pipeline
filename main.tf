module "vpc_module" {
  source                = "./modules/vpc"
  vpc_cidr_block        = var.vpc_cidr_block
  public_subnet_cidr_a  = var.public_subnet_cidr_a
  private_subnet_cidr_a = var.private_subnet_cidr_a
  public_subnet_cidr_b  = var.public_subnet_cidr_b
  private_subnet_cidr_b = var.private_subnet_cidr_b
  public_subnet_cidr_c  = var.public_subnet_cidr_c
  private_subnet_cidr_c = var.private_subnet_cidr_c
}


resource "aws_s3_bucket" "terraform_state" {
  bucket = "devops-tf-tfstate-backend"
  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
  }
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_policy" "terraform_state" {
  bucket = "${aws_s3_bucket.terraform_state.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::devops-tf-tfstate-backend/*",
      "Condition": {
         "IpAddress": {"aws:SourceIp": "8.8.8.8/32"}
      }
    }
  ]
}
POLICY
}


resource "aws_dynamodb_table" "terraform_locks" {
  name         = "dynamodb-tf-tfstate-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}


resource "aws_security_group" "ubuntu" {
  name        = "ubuntu-security-group"
  description = "Allow HTTP, HTTPS and SSH traffic"

  ingress {
    description = "SSH"
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
    Name = "sg-bastion-host"
  }
}


resource "aws_instance" "ubuntu" {
  key_name      = "aws_key_pair"
  ami           = "ami-043097594a7df80ec"
  instance_type = "t2.micro"
  tags = {
    Name = "Ubuntu-JumpBox"
  }

  vpc_security_group_ids = [
    aws_security_group.ubuntu.id
  ]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("key")
    host        = self.public_ip
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 30
  }
}

resource "aws_eip" "ubuntu" {
  vpc      = true
  instance = aws_instance.ubuntu.id
}