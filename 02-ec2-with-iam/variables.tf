variable "aws_region" {
  description = "AWS region for LocalStack"
  default     = "ap-southeast-1"
}

variable "aws_access_key" {
  type      = string
  sensitive = true
  default   = "access-key"
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
  default   = "secret-key"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to be used for the instance"
  default     = "ami-001ab52b241e49355"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}
