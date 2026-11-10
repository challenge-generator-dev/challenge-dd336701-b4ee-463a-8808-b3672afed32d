# Configuración principal de Terraform para la API de la app de pedidos

# Definición detags comunes para todos los recursos
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = var.owner
  }
}

# Módulo de servidor web
module "web_server" {
  source = "./modules/web_server"

  instance_type   = var.instance_type
  min_instances   = var.min_instances
  max_instances   = var.max_instances
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnet_ids
  security_groups = [module.web_server_security_group.security_group_id]
  key_name        = var.key_name
  user_data       = var.web_server_user_data
  ami_id          = var.ami_id

  tags = local.common_tags
}

# Módulo de base de datos
module "database" {
  source = "./modules/database"

  db_instance_class     = var.db_instance_class
  db_engine             = var.db_engine
  db_engine_version     = var.db_engine_version
  db_allocated_storage  = var.db_allocated_storage
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnet_ids
  security_group_id     = module.database_security_group.security_group_id
  backup_retention_days = var.backup_retention_days
  skip_final_snapshot   = var.skip_final_snapshot

  tags = local.common_tags
}

# Módulo de balanceador de carga
module "load_balancer" {
  source = "./modules/load_balancer"

  name                  = "${var.project_name}-alb"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.public_subnet_ids
  target_group_port     = var.alb_target_group_port
  target_group_protocol = var.alb_target_group_protocol
  health_check_path     = var.alb_health_check_path
  security_groups       = [module.alb_security_group.security_group_id]
  target_instances      = module.web_server.instance_ids

  tags = local.common_tags
}