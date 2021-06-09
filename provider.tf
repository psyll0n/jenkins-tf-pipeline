terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.44.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region                  = "eu-central-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
}


terraform {
  backend "s3" {
    # Replace this with your bucket name
    bucket = "devops-tf-tfstate-backend"
    key    = "tf-tfstate/terraform.tfstate"
    region = "eu-central-1"
    # Replace this with your DynamoDB table name
    dynamodb_table = "terraform-tfstate-locks"
    encrypt        = true
  }
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

