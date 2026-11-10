# Despliegue de la API de la app de pedidos usando Terraform

La aplicación móvil de pedidos requiere una API backend para funcionar. Necesitas aprovisionar la infraestructura necesaria para desplegar esta API utilizando Terraform. La API debe ser accesible y funcional para que la aplicación móvil pueda realizar pedidos. Los recursos aprovisionados incluyen un servidor web, una base de datos y un balanceador de carga. Debes asegurarte de que la infraestructura sea escalable y resiliente.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el backend de una app movil |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial de Terraform

**Objetivo:** Configurar el entorno de Terraform y definir los recursos básicos necesarios para el despliegue.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Identificar los recursos necesarios para desplegar la API.
- Configurar el archivo principal de Terraform.
- Definir los proveedores y las variables necesarias.

**Entregable:** Archivo de configuración de Terraform con los recursos básicos definidos.

<details>
<summary>Pistas de conocimiento</summary>

- Conceptos básicos de Terraform.
- Uso de proveedores y variables en Terraform.

</details>

### Fase 2: Definición de recursos de infraestructura

**Objetivo:** Definir los recursos de infraestructura necesarios para el despliegue de la API, incluyendo servidor web, base de datos y balanceador de carga.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Definir el servidor web y la base de datos en Terraform.
- Configurar el balanceador de carga.
- Asegurar que los recursos sean escalables y resilientes.

**Entregable:** Archivo de configuración de Terraform con los recursos de infraestructura definidos.

<details>
<summary>Pistas de conocimiento</summary>

- Configuración de recursos en Terraform.
- Prácticas para asegurar escalabilidad y resiliencia.

</details>

### Fase 3: Despliegue y verificación de la API

**Objetivo:** Desplegar la API y verificar que esté funcionando correctamente.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Aplicar la configuración de Terraform para desplegar la infraestructura.
- Verificar que la API esté accesible y funcional.
- Realizar pruebas de carga y rendimiento.

**Entregable:** Infraestructura desplegada y API funcional, con pruebas de carga y rendimiento realizadas.

<details>
<summary>Pistas de conocimiento</summary>

- Comandos de Terraform para aplicar la configuración.
- Herramientas para realizar pruebas de carga y rendimiento.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en este reto?
- **paraQueSirve**: ¿Para qué sirve definir los recursos de infraestructura en Terraform?
- **comoSeUsa**: ¿Cómo se utiliza Terraform para desplegar la API?
- **erroresComunes**: ¿Cuáles son los errores comunes al configurar Terraform y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica el despliegue de la API usando Terraform?

## Criterios de Evaluacion

- Configuración inicial de Terraform realizada correctamente.
- Definición de recursos de infraestructura en Terraform.
- Despliegue y verificación de la API funcional.
- Realización de pruebas de carga y rendimiento.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

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

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
