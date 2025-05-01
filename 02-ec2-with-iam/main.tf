terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.96.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  # LocalStack configuration
  skip_credentials_validation = true # don’t validate creds against AWS
  skip_metadata_api_check     = true # don’t hit EC2 metadata
  skip_requesting_account_id  = true # don’t call STS:GetCallerIdentity

  # Point every resources call at LocalStack
  endpoints {
    ec2 = "http://localhost:4566"
    iam = "http://localhost:4566"
  }
}
