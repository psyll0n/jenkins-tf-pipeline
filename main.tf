module "networking" {
  source                = "./modules/networking"
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
  bucket = aws_s3_bucket.terraform_state.id

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
         "IpAddress": {"aws:SourceIp": "0.0.0.0/0"}
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



resource "aws_instance" "ubuntu" {
  key_name      = "aws-ssh-keypair"
  ami           = "ami-043097594a7df80ec"
  instance_type = "t2.micro"
  tags = {
    Name = "Ubuntu-JumpBox"
  }

  vpc_security_group_ids = [
    "${module.networking.sg_id}"
  ]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 10
  }
}

resource "aws_eip" "ubuntu" {
  vpc      = true
  instance = aws_instance.ubuntu.id
}