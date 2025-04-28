resource "aws_s3_bucket" "my_bucket" {
  bucket = "tf-localstack-demo"

  tags = {
    Environment = "local"
    ManagedBy   = "Terraform"
  }
}
