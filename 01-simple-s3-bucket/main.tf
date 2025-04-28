terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.96.0"
    }
  }
}

provider "aws" {
  region     = "ap-southeast-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  # LocalStack configuration
  skip_credentials_validation = true # don’t validate creds against AWS
  skip_metadata_api_check     = true # don’t hit EC2 metadata
  skip_requesting_account_id  = true # don’t call STS:GetCallerIdentity

  # Force path-style URLs for S3
  s3_use_path_style = true

  # Point every S3 call at LocalStack
  endpoints {
    s3 = "http://localhost:4566"
  }
}

