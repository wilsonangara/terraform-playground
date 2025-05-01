output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.example_ec2.id
}

output "instance_public_dns" {
  description = "The public DNS name of the EC2 instance"
  value       = aws_instance.example_ec2.public_dns
}
