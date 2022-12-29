output "ip" {
  description = "Private IP Address of EC2"
  value       = aws_instance.server.private_ip
}