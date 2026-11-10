# Valores de variables para el entorno de desarrollo
# Estas variables configuran la infraestructura para el entorno dev

# Configuración general del proyecto
project_name = "pedidos-app"
environment  = "dev"
aws_region   = "us-east-1"

# Configuración del servidor web
web_server_instance_type  = "t3.micro"
web_server_instance_count = 1
web_server_ami            = "ami-0c55b159cbfafe1f0"
web_server_port           = 80
web_server_protocol       = "http"

# Configuración de la base de datos
database_instance_class    = "db.t3.micro"
database_allocated_storage = 20
database_engine_version    = "14.7"
database_name              = "pedidos_db"
database_username          = "dbadmin"
# Nota: La contraseña se debe manejar de forma segura, ideally usando SSM Parameter Store
database_password = "DevPassword2024!"
database_port     = 5432

# Configuración del balanceador de carga
lb_type                  = "application"
lb_scheme                = "internet-facing"
lb_deregistration_delay  = 30
lb_health_check_path     = "/health"
lb_health_check_interval = 30

# Configuración de red
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

# Etiquetas para gestión de recursos
tags = {
  Environment = "dev"
  Project     = "pedidos-app"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
  Team        = "mobile-backend"
}

# Configuración de escalabilidad
enable_autoscaling     = false
min_instance_count     = 1
max_instance_count     = 3
target_cpu_utilization = 70