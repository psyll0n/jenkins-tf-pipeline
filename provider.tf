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



