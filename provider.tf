provider "aws" {
  region                  = "eu-central-1"
  shared_credentials_file = "/home/psyll0n/.aws"
  profile                 = "default"
}


terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "devops-tf-tfstate-backend"
    key            = "tf-tfstate/terraform.tfstate"
    region         = "eu-central-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-tfstate-locks"
    encrypt        = true
  }
}


output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}
output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}