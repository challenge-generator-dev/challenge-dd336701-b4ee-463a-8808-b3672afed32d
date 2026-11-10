# Módulo de Infraestructura para API de App de Pedidos

## Descripción

Este módulo de Terraform aprovisiona la infraestructura necesaria para desplegar la API backend de la aplicación móvil de pedidos. La infraestructura incluye servidor web, base de datos y balanceador de carga.

## Estructura del Proyecto

```
infra/
├── versions.tf           # Configuración de versiones de Terraform y providers
├── main.tf               # Recursos principales y configuración global
├── providers.tf          # Configuración del provider AWS
├── variables.tf          # Definición de variables del módulo
├── outputs.tf            # Salidas del módulo
├── terraform.tfvars      # Valores de variables para desarrollo
├── modules/
│   ├── web_server/       # Módulo de servidor web
│   ├── database/         # Módulo de base de datos
│   └── load_balancer/    # Módulo de balanceador de carga
└── envs/
    └── dev/              # Configuración del entorno de desarrollo
```

## Recursos Definidos

### Servidor Web

El módulo `web_server` aprovisiona:
- Instancias EC2 para ejecutar la API
- Security groups para permitir tráfico HTTP/HTTPS
- Configuración de auto-scaling

### Base de Datos

El módulo `database` aprovisiona:
- Instancia RDS PostgreSQL o MySQL
- Subnet group para la base de datos
- Security group para permitir conexiones desde el servidor web
- Configuración de backups automáticos

### Balanceador de Carga

El módulo `load_balancer` aprovisiona:
- Application Load Balancer (ALB)
- Target groups para las instancias del servidor
- Listeners para HTTP/HTTPS
- Security group para tráfico externo

## Uso del Módulo

### Inicialización

```bash
cd infra
terraform init
```

### Validación

```bash
terraform validate
```

### Plan de Ejecución

```bash
terraform plan -var-file=terraform.tfvars
```

### Aplicar Infraestructura

```bash
terraform apply -var-file=terraform.tfvars
```

### Destruir Infraestructura

```bash
terraform destroy -var-file=terraform.tfvars
```

## Variables Principales

| Variable | Descripción | Tipo | Valor por defecto |
|----------|-------------|------|-------------------|
| `aws_region` | Región de AWS | string | "us-east-1" |
| `project_name` | Nombre del proyecto | string | "pedidos-app" |
| `environment` | Entorno de despliegue | string | "dev" |
| `vpc_cidr` | CIDR de la VPC | string | "10.0.0.0/16" |
| `db_instance_class` | Clase de instancia de base de datos | string | "db.t3.micro" |
| `instance_type` | Tipo de instancia EC2 | string | "t3.micro" |
| `min_instances` | Minimum de instancias en auto-scaling | number | 1 |
| `max_instances` | Máximo de instancias en auto-scaling | number | 3 |

## Outputs

| Output | Descripción |
|--------|-------------|
| `alb_dns_name` | DNS del Application Load Balancer |
| `web_server_security_group_id` | ID del security group del servidor web |
| `database_endpoint` | Endpoint de la base de datos RDS |
| `database_name` | Nombre de la base de datos |

## Validación Local

Para validar la configuración antes de aplicar:

1. Ejecutar `terraform fmt` para formatear archivos
2. Ejecutar `terraform validate` para validar sintaxis
3. Ejecutar `terraform plan` para ver los cambios planificados

## Consideraciones de Seguridad

- Las credenciales de AWS se manejan vía variables de entorno o perfil configurado
- Los valores sensibles como contraseñas se almacenan en terraform.tfvars (no versionar)
- Los security groups siguen el principio de mínimo privilegio
- RDS tiene encriptación habilitada por defecto
- Los logs se envían a CloudWatch

## Colaboración en Equipo

El estado remoto está configurado con S3 y DynamoDB para bloquear estados concurrentes. Asegurate de:

1. Tener acceso al bucket S3 configurado
2. Tener permisos de write en la tabla DynamoDB
3. No modificar manualmente el estado