# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/web_server/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/web_server/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/web_server/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/database/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/load_balancer/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/load_balancer/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/modules/load_balancer/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/envs/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `infra/envs/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `client` | `client/` | chapter, support | client | Flutter | Flutter |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd client && flutter pub get && flutter analyze` — componente `client` (chapter, support).

### Contratos entre componentes

- `client` expone http (api: https://${load_balancer_dns}/api):
  - `POST /orders`
  - `GET /orders/{id}`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform para la app movil (corrida e2e 20261109213213585), Aprovisiona con Terraform los recursos que consume la aplicacion movil

### Misión / candidato
Desplegar la API de la app de pedidos

### Reto
- Tema: Infraestructura como codigo para el backend de una app movil
- Seniority: senior-l2
- Tipo: practical
- Título: Despliegue de la API de la app de pedidos usando Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Terraform — objetivo: Configurar el entorno de Terraform y definir los recursos básicos necesarios para el despliegue. — entregable (NO resolver): Archivo de configuración de Terraform con los recursos básicos definidos.
- Fase 2: Definición de recursos de infraestructura — objetivo: Definir los recursos de infraestructura necesarios para el despliegue de la API, incluyendo servidor web, base de datos y balanceador de carga. — entregable (NO resolver): Archivo de configuración de Terraform con los recursos de infraestructura definidos.
- Fase 3: Despliegue y verificación de la API — objetivo: Desplegar la API y verificar que esté funcionando correctamente. — entregable (NO resolver): Infraestructura desplegada y API funcional, con pruebas de carga y rendimiento realizadas.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: infra/providers.tf ===
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

// === ARCHIVO: infra/variables.tf ===
# Variables globales para la configuración de Terraform
# Estas variables son utilizadas por los módulos y el entorno principal

variable "aws_region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  # Escribe el valor por defecto que prefieras o déjalo vacío para requerirlo en terraform.tfvars
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "El entorno debe ser uno de: dev, staging, prod"
  }
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetado de recursos"
  type        = string
  default     = "mobile-order-api"
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
}

// === ARCHIVO: infra/modules/web_server/variables.tf ===
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

// === ARCHIVO: infra/modules/database/variables.tf ===
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

// === ARCHIVO: infra/modules/load_balancer/variables.tf ===
# Variables específicas para el módulo del balanceador de carga

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subnets donde se desplegará el balanceador de carga"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegará el balanceador de carga"
  type        = string
}

variable "security_group_ids" {
  description = "Lista de IDs de security groups para el balanceador de carga"
  type        = list(string)
}

variable "internal" {
  description = "Indica si el balanceador de carga es interno"
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "Tipo de balanceador de carga (application, network)"
  type        = string
  default     = "application"
}

variable "target_group_port" {
  description = "Puerto del target group"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocolo del target group"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Ruta para el health check"
  type        = string
  default     = "/health"
}

variable "health_check_interval" {
  description = "Intervalo entre health checks en segundos"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Timeout para el health check en segundos"
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "Número de health checks exitosos para considerar saludable"
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "Número de health checks fallidos para considerar no saludable"
  type        = number
  default     = 3
}

variable "tags" {
  description = "Etiquetas adicionales para los recursos"
  type        = map(string)
  default     = {}
}

// === ARCHIVO: infra/envs/dev/variables.tf ===
# Variables específicas para el entorno de desarrollo

variable "aws_region" {
  description = "Región de AWS para desarrollo"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para desarrollo"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "Clase de instancia para la base de datos en desarrollo"
  type        = string
  default     = "db.t3.micro"
}

variable "database_username" {
  description = "Nombre de usuario para la base de datos en desarrollo"
  type        = string
  sensitive   = true
}

variable "database_password" {
  description = "Contraseña para la base de datos en desarrollo"
  type        = string
  sensitive   = true
}

variable "min_size" {
  description = "Tamaño mínimo del grupo de autoescalado en desarrollo"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Tamaño máximo del grupo de autoescalado en desarrollo"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Capacidad deseada del grupo de autoescalado en desarrollo"
  type        = number
  default     = 1
}

// === ARCHIVO: infra/versions.tf ===
terraform {
  required_version = ">= 1.7.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

// === ARCHIVO: infra/README.md ===
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

// === ARCHIVO: infra/main.tf ===
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

// === ARCHIVO: infra/outputs.tf ===
# Superficie de práctica: completa las definiciones de salida para exponer
# información crítica de la infraestructura aprovisionada.
#
# Ejemplos de outputs típicos:
# - IP pública del servidor web
# - Endpoint del balanceador de carga
# - Cadena de conexión a la base de datos
# - ARN de recursos creados

# TODO: Definir outputs para:
# 1. outputs del servidor web
# 2. outputs de la base de datos
# 3. outputs del balanceador de carga
# 4. cualquier output adicional que sea útil para la aplicación móvil

# output "web_server_public_ip" {
#   description = "IP pública del servidor web"
#   value       = module.web_server.public_ip
# }

# output "load_balancer_dns" {
#   description = "DNS del balanceador de carga"
#   value       = module.load_balancer.dns_name
# }

# output "database_endpoint" {
#   description = "Endpoint de la base de datos"
#   value       = module.database.endpoint
# }

// === ARCHIVO: infra/terraform.tfvars ===
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

// === ARCHIVO: infra/environments/dev/terraform.tfvars ===
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

// === ARCHIVO: infra/modules/web_server/main.tf ===
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

// === ARCHIVO: infra/modules/web_server/outputs.tf ===
# Salidas del módulo de servidor web
# Exponemos la información necesaria para que otros componentes
# puedan conectarse a este servidor

output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.web_server.id
}

output "instance_public_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_instance.web_server.public_ip
}

output "instance_private_ip" {
  description = "IP privada de la instancia EC2"
  value       = aws_instance.web_server.private_ip
}

output "security_group_id" {
  description = "ID del Security Group del servidor web"
  value       = aws_security_group.web_sg.id
}

output "availability_zone" {
  description = "Zona de disponibilidad donde se aprovisionó la instancia"
  value       = aws_instance.web_server.availability_zone
}

output "instance_dns" {
  description = "DNS público de la instancia"
  value       = aws_instance.web_server.public_dns
}

output "ssh_command" {
  description = "Comando SSH para conectar al servidor"
  value       = "ssh -i ${var.key_name} ubuntu@${aws_instance.web_server.public_ip}"
  sensitive   = false
}

// === ARCHIVO: infra/modules/database/main.tf ===
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

// === ARCHIVO: infra/modules/database/outputs.tf ===
# Outputs del módulo de base de datos
# Superficie de práctica: el estudiante definirá las salidas necesarias

output "database_endpoint" {
  description = "Endpoint de conexión a la base de datos"
  value       = aws_db_instance.main.endpoint
}

output "database_port" {
  description = "Puerto de la base de datos"
  value       = aws_db_instance.main.port
}

output "database_arn" {
  description = "ARN de la instancia de base de datos"
  value       = aws_db_instance.main.arn
}

output "database_name" {
  description = "Nombre de la base de datos"
  value       = aws_db_instance.main.db_name
}

output "database_security_group_id" {
  description = "ID del security group de la base de datos"
  value       = aws_security_group.database.id
}

// === ARCHIVO: infra/modules/load_balancer/main.tf ===
# Configuración del módulo de balanceador de carga
# Superficie de práctica: el estudiante definirá los recursos del ALB

# Security Group para el balanceador de carga
resource "aws_security_group" "alb" {
  name        = "${var.prefix}-alb-sg"
  description = "Security group para el Application Load Balancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.prefix}-alb-sg"
  })
}

# Target Group para los servidores web
resource "aws_lb_target_group" "main" {
  name     = "${var.prefix}-tg"
  port     = var.target_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = var.health_check_path
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = merge(var.tags, {
    Name = "${var.prefix}-tg"
  })
}

# Application Load Balancer
resource "aws_lb" "main" {
  name               = "${var.prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.subnet_ids

  enable_deletion_protection = var.enable_deletion_protection

  tags = merge(var.tags, {
    Name = "${var.prefix}-alb"
  })
}

# Listener HTTP
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

// === ARCHIVO: infra/modules/load_balancer/outputs.tf ===
# Outputs del módulo de balanceador de carga
# Superficie de práctica: el estudiante definirá las salidas necesarias

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.main.arn
}

output "alb_id" {
  description = "ID del Application Load Balancer"
  value       = aws_lb.main.id
}

output "alb_dns_name" {
  description = "Nombre DNS del ALB"
  value       = aws_lb.main.dns_name
}

output "alb_zone_id" {
  description = "Zone ID del ALB"
  value       = aws_lb.main.zone_id
}

output "alb_security_group_id" {
  description = "ID del security group del ALB"
  value       = aws_security_group.alb.id
}

output "target_group_arn" {
  description = "ARN del target group"
  value       = aws_lb_target_group.main.arn
}

output "target_group_name" {
  description = "Nombre del target group"
  value       = aws_lb_target_group.main.name
}

output "listener_arn" {
  description = "ARN del listener HTTP"
  value       = aws_lb_listener.http.arn
}

// === ARCHIVO: infra/envs/dev/main.tf ===
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

// === ARCHIVO: client/pubspec.yaml ===
name: mobile_order_app
description: Aplicación móvil de pedidos con backend desplegado en Terraform.

version: 1.0.0+1

environment:
  sdk: ">=3.6.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.1
  riverpod: ^2.5.1
  dio: ^5.4.3
  flutter_riverpod: ^2.5.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true

// === ARCHIVO: client/lib/main.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/core/utils/constants.dart';
import 'package:mobile_order_app/presentation/screens/order_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Order App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OrderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// === Provider para el cliente HTTP ===
final dioProvider = Provider((ref) {
  final dio = Dio();
  dio.options.baseUrl = Constants.apiBaseUrl;
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.interceptors.add(LogInterceptor(responseBody: true));
  return dio;
});

// === Modelos para la API ===
class OrderRequest {
  final String productId;
  final int quantity;
  final String customerId;

  OrderRequest({
    required this.productId,
    required this.quantity,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'customerId': customerId,
    };
  }
}

class OrderResponse {
  final String id;
  final String productId;
  final int quantity;
  final String customerId;
  final String status;
  final DateTime createdAt;

  OrderResponse({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.customerId,
    required this.status,
    required this.createdAt,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
      customerId: json['customerId'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

// === ARCHIVO: client/lib/domain/entities/order.dart ===
package domain.entities;

import 'package:flutter/foundation.dart';

/// Entidad que representa un pedido en el dominio.
/// Contiene los datos esenciales de un pedido realizado por un cliente.
class Order {
  final String id;
  final String productId;
  final int quantity;
  final String customerId;
  final String status;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.customerId,
    required this.status,
    required this.createdAt,
  });

  /// Crea una instancia de [Order] a partir de un mapa JSON.
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      productId: json['productId'] as String,
      quantity: json['quantity'] as int,
      customerId: json['customerId'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  /// Convierte la entidad [Order] a un mapa JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'customerId': customerId,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Crea una copia de la entidad [Order] con los campos actualizados.
  Order copyWith({
    String? id,
    String? productId,
    int? quantity,
    String? customerId,
    String? status,
    DateTime? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      customerId: customerId ?? this.customerId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Order &&
        other.id == id &&
        other.productId == productId &&
        other.quantity == quantity &&
        other.customerId == customerId &&
        other.status == status &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      productId,
      quantity,
      customerId,
      status,
      createdAt,
    );
  }
}

// === ARCHIVO: client/lib/domain/repositories/order_repository.dart ===
package domain.repositories;

import '../entities/order.dart';

/// Interfaz del repositorio para operaciones de pedidos.
/// Define los contratos que deben implementarse para interactuar con los pedidos.
abstract class OrderRepository {
  /// Crea un nuevo pedido.
  /// [orderRequest]: Los datos del pedido a crear.
  /// Retorna un [Future] que se completa con la entidad [Order] creada.
  Future<Order> createOrder(OrderRequest orderRequest);

  /// Obtiene un pedido por su identificador.
  /// [orderId]: El identificador del pedido.
  /// Retorna un [Future] que se completa con la entidad [Order] encontrada.
  Future<Order> getOrder(String orderId);
}

/// DTO para la creación de un pedido.
/// Contiene los datos necesarios para crear un pedido.
class OrderRequest {
  final String productId;
  final int quantity;
  final String customerId;

  OrderRequest({
    required this.productId,
    required this.quantity,
    required this.customerId,
  });

  /// Convierte el [OrderRequest] a un mapa JSON.
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'customerId': customerId,
    };
  }
}

// === ARCHIVO: client/lib/domain/usecases/create_order.dart ===
package domain.usecases;

import '../entities/order.dart';
import '../repositories/order_repository.dart';

/// Caso de uso para crear un pedido.
/// Encapsula la lógica de negocio para la creación de pedidos.
class CreateOrder {
  final OrderRepository orderRepository;

  CreateOrder(this.orderRepository);

  /// Ejecuta la creación de un pedido.
  /// [orderRequest]: Los datos del pedido a crear.
  /// Retorna un [Future] que se completa con la entidad [Order] creada.
  Future<Order> call(OrderRequest orderRequest) async {
    if (orderRequest.quantity <= 0) {
      throw ArgumentError('La cantidad debe ser mayor que cero.');
    }
    if (orderRequest.productId.isEmpty) {
      throw ArgumentError('El ID del producto no puede estar vacío.');
    }
    if (orderRequest.customerId.isEmpty) {
      throw ArgumentError('El ID del cliente no puede estar vacío.');
    }

    return await orderRepository.createOrder(orderRequest);
  }
}

// === ARCHIVO: client/lib/core/network/api_client.dart ===
import 'package:dio/dio.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';

class ApiClient {
  final Dio _dio;
  final String baseUrl;

  ApiClient({required this.baseUrl, Dio? dio})
      : _dio = dio ?? Dio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<Order> createOrder(OrderRequest orderRequest) async {
    try {
      final response = await _dio.post(
        '/orders',
        data: orderRequest.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Order.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ApiException(
          message: 'Error al crear la orden',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Order> getOrder(String orderId) async {
    try {
      final response = await _dio.get('/orders/$orderId');

      if (response.statusCode == 200) {
        return Order.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ApiException(
          message: 'Error al obtener la orden',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  ApiException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(
          message: 'Tiempo de conexión agotado. Verifica tu conexión a internet.',
          statusCode: null,
        );
      case DioExceptionType.sendTimeout:
        return ApiException(
          message: 'Tiempo de envío agotado. Intenta de nuevo.',
          statusCode: null,
        );
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: 'Tiempo de recepción agotado. El servidor está tardando demasiado.',
          statusCode: null,
        );
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = _extractErrorMessage(error.response?.data);
        return ApiException(
          message: message,
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return ApiException(
          message: 'Solicitud cancelada.',
          statusCode: null,
        );
      case DioExceptionType.connectionError:
        return ApiException(
          message: 'Error de conexión. Verifica tu conexión a internet.',
          statusCode: null,
        );
      default:
        return ApiException(
          message: 'Error desconocido: ${error.message}',
          statusCode: null,
        );
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data == null) {
      return 'Error del servidor';
    }
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ?? 
             data['error'] as String? ?? 
             'Error del servidor';
    }
    return 'Error del servidor';
  }

  void dispose() {
    _dio.close();
  }
}

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  @override
  String toString() {
    if (statusCode != null) {
      return 'ApiException: $message (Status: $statusCode)';
    }
    return 'ApiException: $message';
  }
}

// === ARCHIVO: client/lib/core/utils/constants.dart ===
class ApiConstants {
  static const String defaultBaseUrl = 'https://load_balancer_dns/api';
  
  static const String ordersEndpoint = '/orders';
  
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

class AppConstants {
  static const String appName = 'Mobile Order App';
  static const String appVersion = '1.0.0';
  
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);
  
  static const int pageSize = 20;
  static const int cacheMaxAge = 300;
}

class StorageKeys {
  static const String authToken = 'auth_token';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String lastSync = 'last_sync';
  static const String cachedOrders = 'cached_orders';
}

class OrderStatus {
  static const String pending = 'pending';
  static const String confirmed = 'confirmed';
  static const String processing = 'processing';
  static const String shipped = 'shipped';
  static const String delivered = 'delivered';
  static const String cancelled = 'cancelled';

  static const List<String> activeStatuses = [
    pending,
    confirmed,
    processing,
    shipped,
  ];

  static const List<String> finalStatuses = [
    delivered,
    cancelled,
  ];

  static bool isActive(String status) => activeStatuses.contains(status);
  static bool isFinal(String status) => finalStatuses.contains(status);
}

class ErrorMessages {
  static const String networkError = 'Error de conexión. Verifica tu conexión a internet.';
  static const String serverError = 'Error del servidor. Intenta de nuevo más tarde.';
  static const String timeoutError = 'Tiempo de espera agotado. Intenta de nuevo.';
  static const String unknownError = 'Ocurrió un error inesperado.';
  static const String unauthorizedError = 'No autorizado. Inicia sesión nuevamente.';
  static const String notFoundError = 'Recurso no encontrado.';
  static const String validationError = 'Datos inválidos. Verifica la información ingresada.';
}

class RegexPatterns {
  static final RegExp email = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp phone = RegExp(
    r'^\+?[1-9]\d{1,14}$',
  );
  static final RegExp uuid = RegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
  );
}

// === ARCHIVO: client/android/app/src/main/AndroidManifest.xml ===
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    
    <application
        android:label="Mobile Order App"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="true">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
            
        <meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="ca-app-pub-3940256099942544~3347511713"/>
            
    </application>
    
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
    
</manifest>

// === ARCHIVO: client/lib/presentation/screens/order_screen.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/domain/entities/order.dart';
import 'package:mobile_order_app/domain/repositories/order_repository.dart';
import 'package:mobile_order_app/domain/usecases/create_order.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  throw UnimplementedError('OrderRepository debe ser proveído por el contenedor');
});

final createOrderUseCaseProvider = Provider<CreateOrder>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return CreateOrder(repository);
});

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productIdController = TextEditingController();
  final _quantityController = TextEditingController();
  final _customerIdController = TextEditingController();
  
  bool _isLoading = false;
  String? _errorMessage;
  Order? _createdOrder;

  @override
  void dispose() {
    _productIdController.dispose();
    _quantityController.dispose();
    _customerIdController.dispose();
    super.dispose();
  }

  Future<void> _createOrder() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _createdOrder = null;
    });

    try {
      final createOrderUseCase = ref.read(createOrderUseCaseProvider);
      final orderRequest = OrderRequest(
        productId: _productIdController.text.trim(),
        quantity: int.parse(_quantityController.text.trim()),
        customerId: _customerIdController.text.trim(),
      );

      final order = await createOrderUseCase(orderRequest);
      
      setState(() {
        _createdOrder = order;
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pedido creado: ${order.id}'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _getOrder(String orderId) async {
    if (orderId.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _createdOrder = null;
    });

    try {
      final repository = ref.read(orderRepositoryProvider);
      final order = await repository.getOrder(orderId);
      
      setState(() {
        _createdOrder = order;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crear nuevo pedido',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _productIdController,
                        decoration: const InputDecoration(
                          labelText: 'ID del producto',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.inventory_2),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingrese el ID del producto';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _quantityController,
                        decoration: const InputDecoration(
                          labelText: 'Cantidad',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.numbers),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingrese la cantidad';
                          }
                          final quantity = int.tryParse(value.trim());
                          if (quantity == null || quantity <= 0) {
                            return 'Cantidad inválida';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _customerIdController,
                        decoration: const InputDecoration(
                          labelText: 'ID del cliente',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Ingrese el ID del cliente';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _isLoading ? null : _createOrder,
                          icon: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Icon(Icons.send),
                          label: Text(_isLoading ? 'Creando...' : 'Crear pedido'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Consultar pedido',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'ID del pedido',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.search),
                              ),
                              onSubmitted: _getOrder,
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton.filled(
                            onPressed: _isLoading
                                ? null
                                : () {
                                    final controller = TextEditingController();
                                    _getOrder(controller.text);
                                  },
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (_errorMessage != null) ...
                [
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.red.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red.shade700),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: TextStyle(color: Colors.red.shade700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              if (_createdOrder != null) ...
                [
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green.shade700),
                              const SizedBox(width: 12),
                              Text(
                                'Pedido encontrado',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          _buildOrderDetail('ID', _createdOrder!.id),
                          _buildOrderDetail('Producto', _createdOrder!.productId),
                          _buildOrderDetail('Cantidad', _createdOrder!.quantity.toString()),
                          _buildOrderDetail('Cliente', _createdOrder!.customerId),
                          _buildOrderDetail('Estado', _createdOrder!.status),
                          _buildOrderDetail(
                            'Creado',
                            _createdOrder!.createdAt.toLocal().toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

// === ARCHIVO: client/lib/data/datasources/order_remote_data_source.dart ===
import 'package:dio/dio.dart';
import 'package:mobile_order_app/domain/entities/order.dart';

abstract class OrderRemoteDataSource {
  Future<Order> createOrder(OrderRequest orderRequest);
  Future<Order> getOrder(String orderId);
}

class OrderRequest {
  final String productId;
  final int quantity;
  final String customerId;

  OrderRequest({
    required this.productId,
    required this.quantity,
    required this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
      'customerId': customerId,
    };
  }
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Dio dio;
  final String baseUrl;

  OrderRemoteDataSourceImpl({
    required this.dio,
    required this.baseUrl,
  });

  @override
  Future<Order> createOrder(OrderRequest orderRequest) async {
    try {
      final response = await dio.post(
        '$baseUrl/orders',
        data: orderRequest.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = response.data as Map<String, dynamic>;
        return Order.fromJson(json);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Error al crear pedido: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<Order> getOrder(String orderId) async {
    try {
      final response = await dio.get(
        '$baseUrl/orders/$orderId',
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final json = response.data as Map<String, dynamic>;
        return Order.fromJson(json);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Error al obtener pedido: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Tiempo de conexión agotado. Verifique su conexión a internet.');
      case DioExceptionType.connectionError:
        return Exception('No se pudo conectar al servidor. Verifique la URL y su conexión.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Error del servidor';
        if (statusCode == 404) {
          return Exception('Pedido no encontrado');
        } else if (statusCode == 400) {
          return Exception('Solicitud inválida: $message');
        } else if (statusCode == 500) {
          return Exception('Error interno del servidor');
        }
        return Exception('Error del servidor: $statusCode - $message');
      case DioExceptionType.cancel:
        return Exception('Solicitud cancelada');
      default:
        return Exception('Error de red: ${e.message}');
    }
  }
}

// === ARCHIVO: client/lib/data/repositories/order_repository_impl.dart ===
import 'package:mobile_order_app/domain/entities/order.dart';
import 'package:mobile_order_app/domain/repositories/order_repository.dart';
import 'package:mobile_order_app/data/datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Order> createOrder(OrderRequest orderRequest) async {
    final remoteRequest = OrderRequest(
      productId: orderRequest.productId,
      quantity: orderRequest.quantity,
      customerId: orderRequest.customerId,
    );
    
    return await remoteDataSource.createOrder(remoteRequest);
  }

  @override
  Future<Order> getOrder(String orderId) async {
    if (orderId.isEmpty) {
      throw ArgumentError('El ID del pedido no puede estar vacío');
    }
    
    return await remoteDataSource.getOrder(orderId);
  }
}
```
