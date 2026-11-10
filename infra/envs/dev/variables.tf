# Variables específicas para el entorno de desarrollo

variable "aws_region" {
  description = "Región de AWS para desarrollo"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para desarrollo"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos en desarrollo"
  type        = string
  default     = "db.t3.micro"
}

variable "database_username" {
  description = "Nombre de usuario para la base de datos en desarrollo"
  type        = string
  sensitive   = true
}

variable "database_password" {
  description = "Contraseña para la base de datos en desarrollo"
  type        = string
  sensitive   = true
}

variable "min_size" {
  description = "Tamaño mínimo del grupo de autoescalado en desarrollo"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Tamaño máximo del grupo de autoescalado en desarrollo"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Capacidad deseada del grupo de autoescalado en desarrollo"
  type        = number
  default     = 1
}