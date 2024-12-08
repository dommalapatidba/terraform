output "name" {
  description = "public ip"
  value = aws_instance.name.public_ip
}