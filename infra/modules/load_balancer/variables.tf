# Variables específicas para el módulo del balanceador de carga

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets donde se desplegará el balanceador de carga"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegará el balanceador de carga"
  type        = string
}

variable "security_group_ids" {
  description = "Lista de IDs de security groups para el balanceador de carga"
  type        = list(string)
}

variable "internal" {
  description = "Indica si el balanceador de carga es interno"
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "Tipo de balanceador de carga (application, network)"
  type        = string
  default     = "application"
}

variable "target_group_port" {
  description = "Puerto del target group"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocolo del target group"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Ruta para el health check"
  type        = string
  default     = "/health"
}

variable "health_check_interval" {
  description = "Intervalo entre health checks en segundos"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Timeout para el health check en segundos"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "Número de health checks exitosos para considerar saludable"
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "Número de health checks fallidos para considerar no saludable"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}