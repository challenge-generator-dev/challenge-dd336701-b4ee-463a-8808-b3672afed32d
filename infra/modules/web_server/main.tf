# Módulo de servidor web para la API de la app de pedidos
# Este módulo aprovisiona una instancia EC2 para correr el servicio de la API
#
# Recursos aprovisionados:
# - Instancia EC2 para el servidor de la API
# - Security Group para controlar el tráfico
# - Elastic IP (opcional) para acceso persistente

# Configuración del servidor web
resource "aws_instance" "web_server" {
  # AMI del sistema operativo - Ubuntu 22.04 LTS
  ami           = var.ami_id
  instance_type = var.instance_type

  # Configuración de red
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = var.associate_public_ip

  # Clave SSH para acceso
  key_name = var.key_name

  # User data para inicialización del servidor
  user_data = templatefile("${path.module}/user_data.sh", {
    api_port    = var.api_port
    environment = var.environment
    db_host     = var.db_host
    db_port     = var.db_port
    db_name     = var.db_name
    db_user     = var.db_user
  })

  # Etiquetas para identificación
  tags = merge(
    var.common_tags,
    {
      Name        = "${var.environment}-web-server-${var.instance_suffix}"
      Type        = "web_server"
      Environment = var.environment
      Component   = "api-backend"
    }
  )
}

# Security Group para el servidor web
resource "aws_security_group" "web_sg" {
  name        = "${var.environment}-web-server-sg-${var.instance_suffix}"
  description = "Security group para el servidor web de la API"
  vpc_id      = var.vpc_id

  # Tráfico entrante
  ingress {
    description = "HTTP desde ALB"
    from_port   = var.api_port
    to_port     = var.api_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  ingress {
    description = "SSH para administración"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
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
      Name        = "${var.environment}-web-sg"
      Environment = var.environment
    }
  )
}

# Volumen adicional para datos de la aplicación
resource "aws_ebs_volume" "app_data" {
  count             = var.add_ebs_volume ? 1 : 0
  availability_zone = var.availability_zone
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type
  encrypted         = var.ebs_encrypted

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-app-data-${var.instance_suffix}"
    }
  )
}

# Adjuntar volumen a la instancia
resource "aws_volume_attachment" "app_data_attachment" {
  count       = var.add_ebs_volume ? 1 : 0
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.app_data[0].id
  instance_id = aws_instance.web_server.id
}