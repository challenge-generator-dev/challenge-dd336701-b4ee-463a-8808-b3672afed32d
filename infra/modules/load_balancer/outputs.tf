# Outputs del módulo de balanceador de carga
# Superficie de práctica: el estudiante definirá las salidas necesarias

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.main.arn
}

output "alb_id" {
  description = "ID del Application Load Balancer"
  value       = aws_lb.main.id
}

output "alb_dns_name" {
  description = "Nombre DNS del ALB"
  value       = aws_lb.main.dns_name
}

output "alb_zone_id" {
  description = "Zone ID del ALB"
  value       = aws_lb.main.zone_id
}

output "alb_security_group_id" {
  description = "ID del security group del ALB"
  value       = aws_security_group.alb.id
}

output "target_group_arn" {
  description = "ARN del target group"
  value       = aws_lb_target_group.main.arn
}

output "target_group_name" {
  description = "Nombre del target group"
  value       = aws_lb_target_group.main.name
}

output "listener_arn" {
  description = "ARN del listener HTTP"
  value       = aws_lb_listener.http.arn
}