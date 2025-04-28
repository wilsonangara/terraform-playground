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
