# Variables específicas para el módulo del servidor web

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servidor web"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para el servidor web"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets donde se desplegarán las instancias"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs de security groups para las instancias"
  type        = list(string)
}

variable "min_size" {
  description = "Tamaño mínimo del grupo de autoescalado"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Tamaño máximo del grupo de autoescalado"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Capacidad deseada del grupo de autoescalado"
  type        = number
  default     = 2
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
  default     = null
}

variable "user_data" {
  description = "Script de user data para configurar la instancia al arrancar"
  type        = string
  default     = null
}

variable "tags" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}