# Variables específicas para el módulo de base de datos

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Almacenamiento asignado para la base de datos"
  type        = number
  default     = 20
}

variable "engine" {
  description = "Motor de la base de datos"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Versión del motor de la base de datos"
  type        = string
  default     = "13.4"
}

variable "username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
  sensitive   = true
}

variable "password" {
  description = "Contraseña para la base de datos"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets para el grupo de subnets de la base de datos"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs de security groups para la base de datos"
  type        = list(string)
}

variable "multi_az" {
  description = "Habilitar despliegue multi-AZ para la base de datos"
  type        = bool
  default     = false
}

variable "storage_type" {
  description = "Tipo de almacenamiento para la base de datos"
  type        = string
  default     = "gp2"
}

variable "backup_retention_period" {
  description = "Período de retención de backups en días"
  type        = number
  default     = 7
}

variable "skip_final_snapshot" {
  description = "Omitir la creación de un snapshot final al eliminar la base de datos"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}