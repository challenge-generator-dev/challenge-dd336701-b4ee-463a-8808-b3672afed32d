# Superficie de práctica: completa las definiciones de salida para exponer
# información crítica de la infraestructura aprovisionada.
#
# Ejemplos de outputs típicos:
# - IP pública del servidor web
# - Endpoint del balanceador de carga
# - Cadena de conexión a la base de datos
# - ARN de recursos creados

# TODO: Definir outputs para:
# 1. outputs del servidor web
# 2. outputs de la base de datos
# 3. outputs del balanceador de carga
# 4. cualquier output adicional que sea útil para la aplicación móvil

# output "web_server_public_ip" {
#   description = "IP pública del servidor web"
#   value       = module.web_server.public_ip
# }

# output "load_balancer_dns" {
#   description = "DNS del balanceador de carga"
#   value       = module.load_balancer.dns_name
# }

# output "database_endpoint" {
#   description = "Endpoint de la base de datos"
#   value       = module.database.endpoint
# }