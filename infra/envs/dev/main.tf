# Configuración del entorno de desarrollo
# Este archivo define la infraestructura específica para el entorno de desarrollo
# 
# TAREA: Completar la configuración de los módulos para aprovisionar:
# - Servidor web
# - Base de datos
# - Balanceador de carga
#
# Los módulos están definidos en ../modules/ y las variables en variables.tf

# Referencia al proveedor AWS (definido en providers.tf)
provider "aws" {
  region = var.aws_region
}

# Módulo: Servidor Web
# TODO: Configurar el módulo web_server con los recursos necesarios
# El módulo se encuentra en: ../../modules/web_server/
# Referencia las variables en: ../../modules/web_server/variables.tf
# 
# Recursos esperados: instances, security groups, IAM roles

# Módulo: Base de Datos
# TODO: Configurar el módulo database con los recursos necesarios
# El módulo se encuentra en: ../../modules/database/
# Referencia las variables en: ../../modules/database/variables.tf
#
# Recursos esperados: instance, security groups, parameter group, subnet group

# Módulo: Balanceador de Carga
# TODO: Configurar el módulo load_balancer con los recursos necesarios
# El módulo se encuentra en: ../../modules/load_balancer/
# Referencia las variables en: ../../modules/load_balancer/variables.tf
#
# Recursos esperados: load balancer, target groups, listeners, security groups

# Configuración de escalabilidad
# TODO: Implementar escalabilidad usando count o for_each
# Considerar: número de instancias, auto scaling group, métricas

# Etiquetado de recursos
# TODO: Agregar tags consistentes a todos los recursos
# Tags sugeridos: Environment, Project, Owner, CostCenter

# Outputs del entorno
# Los outputs se definen en: outputs.tf (en envs/dev/)
# TODO: Exponer información crítica como IPs, endpoints, URLs