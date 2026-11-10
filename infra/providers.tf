terraform {
  required_version = "1.7.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "mobile-order-api"
      ManagedBy   = "Terraform"
    }
  }
}

variable "aws_region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
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
  default     = "admin"
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
  default     = "t3.micro"
}

variable "ami_id" {
  description = "ID de la AMI para el servidor web"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
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

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Almacenamiento asignado para la base de datos"
  type        = number
  default     = 20
}