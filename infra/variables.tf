# Variables globales para la configuración de Terraform
# Estas variables son utilizadas por los módulos y el entorno principal

variable "aws_region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  # Escribe el valor por defecto que prefieras o déjalo vacío para requerirlo en terraform.tfvars
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "El entorno debe ser uno de: dev, staging, prod"
  }
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetado de recursos"
  type        = string
  default     = "mobile-order-api"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Lista de bloques CIDR para subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Lista de bloques CIDR para subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "database_username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
  sensitive   = true
}

variable "database_password" {
  description = "Contraseña para la base de datos"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servidor web"
  type        = string
}