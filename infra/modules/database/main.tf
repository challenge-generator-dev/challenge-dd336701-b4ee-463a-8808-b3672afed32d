# Módulo de base de datos para la API de la app de pedidos
# Este módulo aprovisiona una instancia RDS PostgreSQL/MySQL
# para almacenar los datos de los pedidos y usuarios
#
# Recursos aprovisionados:
# - Instancia RDS para la base de datos
# - Subnet group para alta disponibilidad
# - Security Group para proteger la base de datos
# - Parameter group para configuración del motor

# Subnet group para la base de datos (alta disponibilidad)
resource "aws_db_subnet_group" "main" {
  name        = "${var.environment}-db-subnet-group-${var.db_instance_suffix}"
  description = "Subnet group para RDS en múltiples AZs"
  subnet_ids  = var.db_subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.environment}-db-subnet-group"
      Environment = var.environment
    }
  )
}

# Security Group para la base de datos
resource "aws_security_group" "database_sg" {
  name        = "${var.environment}-database-sg-${var.db_instance_suffix}"
  description = "Security group para la base de datos RDS"
  vpc_id      = var.vpc_id

  # Tráfico entrante solo desde la VPC y el security group del web server
  ingress {
    description = "PostgreSQL desde VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description     = "PostgreSQL desde Web Server SG"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = var.allowed_security_groups
  }

  # Tráfico saliente
  egress {
    description = "Todo el tráfico saliente"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.environment}-database-sg"
      Environment = var.environment
    }
  )
}

# Instancia de base de datos RDS
resource "aws_db_instance" "main" {
  # Configuración básica
  identifier     = "${var.environment}-api-db-${var.db_instance_suffix}"
  engine         = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class

  # Credenciales (usar secrets manager en producción)
  username = var.db_username
  password = var.db_password

  # Almacenamiento
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type
  storage_encrypted     = var.storage_encrypted

  # Redundancia y disponibilidad
  multi_az               = var.multi_az
  availability_zone      = var.multi_az ? null : var.availability_zone
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.database_sg.id]

  # Configuración de la base de datos
  database_name      = var.database_name
  port               = var.port
  ca_cert_identifier = var.ca_cert_identifier

  # Opciones de backup
  backup_retention_period   = var.backup_retention_period
  backup_window             = var.backup_window
  maintenance_window        = var.maintenance_window
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.environment}-api-db-final-snapshot"

  # Parámetros del motor
  parameter_group_name = aws_db_parameter_group.main.name

  # Opciones adicionales
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  deletion_protection             = var.deletion_protection
  copy_tags_to_snapshot           = true

  # Etiquetas
  tags = merge(
    var.common_tags,
    {
      Name        = "${var.environment}-api-db"
      Environment = var.environment
      Component   = "api-backend"
      Type        = "database"
    }
  )
}

# Parameter group para configuración del motor
resource "aws_db_parameter_group" "main" {
  name   = "${var.environment}-db-params-${var.db_instance_suffix}"
  family = var.parameter_group_family

  # Parámetros personalizados (ajustar según necesidades de la app)
  parameter {
    name  = "max_connections"
    value = var.max_connections
  }

  parameter {
    name  = "shared_buffers"
    value = var.shared_buffers
  }

  parameter {
    name  = "work_mem"
    value = var.work_mem
  }

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.environment}-db-params"
      Environment = var.environment
    }
  )
}

# Option group para configuraciones adicionales del motor
resource "aws_db_option_group" "main" {
  name                 = "${var.environment}-db-options-${var.db_instance_suffix}"
  engine_name          = var.engine
  major_engine_version = var.major_engine_version

  option {
    option_name = "LOG"
  }
}