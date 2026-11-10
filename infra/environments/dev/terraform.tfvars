# Valores específicos para el entorno de desarrollo
# Este archivo sobreescribe los valores por defecto de terraform.tfvars

# Sobreescribir configuración general para dev
environment = "dev"
aws_region  = "us-east-1"

# Configuración de desarrollo del servidor web
web_server_instance_type  = "t3.micro"
web_server_instance_count = 1
web_server_ami            = "ami-0c55b159cbfafe1f0"

# Configuración de desarrollo de la base de datos
database_instance_class    = "db.t3.micro"
database_allocated_storage = 20
database_engine_version    = "14.7"
database_name              = "pedidos_dev"
database_username          = "devuser"
database_password          = "DevPass2024!"
database_port              = 5432

# Configuración del balanceador de carga para dev
lb_type                  = "application"
lb_scheme                = "internet-facing"
lb_health_check_path     = "/api/health"
lb_health_check_interval = 30

# Configuración de red específica de dev
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

# Etiquetas específicas del entorno dev
tags = {
  Environment = "dev"
  Project     = "pedidos-app"
  ManagedBy   = "terraform"
  CostCenter  = "engineering"
  Team        = "mobile-backend"
  Stage       = "development"
}

# Configuración de escalabilidad para dev
enable_autoscaling     = false
min_instance_count     = 1
max_instance_count     = 2
target_cpu_utilization = 75

# Configuración de logging y monitoreo para dev
enable_detailed_monitoring = true
log_level                  = "debug"
enable_cloudwatch_logs     = true
log_retention_days         = 7