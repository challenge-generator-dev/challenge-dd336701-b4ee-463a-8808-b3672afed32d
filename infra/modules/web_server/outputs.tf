# Salidas del módulo de servidor web
# Exponemos la información necesaria para que otros componentes
# puedan conectarse a este servidor

output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.web_server.id
}

output "instance_public_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_instance.web_server.public_ip
}

output "instance_private_ip" {
  description = "IP privada de la instancia EC2"
  value       = aws_instance.web_server.private_ip
}

output "security_group_id" {
  description = "ID del Security Group del servidor web"
  value       = aws_security_group.web_sg.id
}

output "availability_zone" {
  description = "Zona de disponibilidad donde se aprovisionó la instancia"
  value       = aws_instance.web_server.availability_zone
}

output "instance_dns" {
  description = "DNS público de la instancia"
  value       = aws_instance.web_server.public_dns
}

output "ssh_command" {
  description = "Comando SSH para conectar al servidor"
  value       = "ssh -i ${var.key_name} ubuntu@${aws_instance.web_server.public_ip}"
  sensitive   = false
}