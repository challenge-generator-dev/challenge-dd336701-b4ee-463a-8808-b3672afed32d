# Outputs del módulo de base de datos
# Superficie de práctica: el estudiante definirá las salidas necesarias

output "database_endpoint" {
  description = "Endpoint de conexión a la base de datos"
  value       = aws_db_instance.main.endpoint
}

output "database_port" {
  description = "Puerto de la base de datos"
  value       = aws_db_instance.main.port
}

output "database_arn" {
  description = "ARN de la instancia de base de datos"
  value       = aws_db_instance.main.arn
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = aws_db_instance.main.db_name
}

output "database_security_group_id" {
  description = "ID del security group de la base de datos"
  value       = aws_security_group.database.id
}