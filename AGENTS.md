# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Despliegue de la API de la app de pedidos usando Terraform**.

| | |
|---|---|
| Tema | Infraestructura como codigo para el backend de una app movil |
| Nivel | senior-l2 |
| Chapter | Móvil |
| Especialidad | Flutter |
| Stack | Dart / Flutter 3.27 |
| Patron arquitectonico | Clean Architecture con separación de capas (presentation, domain, data) |
| Tiempo estimado | 8 horas |

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

## Receta del stack

Esqueleto obligatorio:

- `pubspec.yaml en la raiz`
- `lib/main.dart con runApp`
- `lib/domain con entidades y repositorios abstractos`
- `lib/data con las implementaciones y el cliente Dio`
- `lib/presentation con screens y blocs/notifiers`

Dependencias:

- flutter 3.27.0
- http 1.2.1
- riverpod 2.5.1
- dio 5.4.3

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Segui el orden de arranque del mapa de componentes (infraestructura local primero) y corre `(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)` desde la raiz: mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Configuración inicial de Terraform**: Archivo de configuración de Terraform con los recursos básicos definidos.
- **Fase 2 — Definición de recursos de infraestructura**: Archivo de configuración de Terraform con los recursos de infraestructura definidos.
- **Fase 3 — Despliegue y verificación de la API**: Infraestructura desplegada y API funcional, con pruebas de carga y rendimiento realizadas.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `infra/versions.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/web_server/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/web_server/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/web_server/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/database/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/database/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/database/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/load_balancer/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/load_balancer/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/modules/load_balancer/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/envs/dev/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `infra/envs/dev/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Lo que falta y tenes que completar

No se detectaron huecos: estan los archivos declarados, el boilerplate del stack y ninguna referencia quedo colgando. Igual corre el comando de verificacion — que los archivos existan no garantiza que compilen.

### Presentes (30)

- `infra/providers.tf`
- `infra/variables.tf`
- `infra/modules/web_server/variables.tf`
- `infra/modules/database/variables.tf`
- `infra/modules/load_balancer/variables.tf`
- `infra/envs/dev/variables.tf`
- `infra/versions.tf`
- `infra/README.md`
- `infra/main.tf`
- `infra/outputs.tf`
- `infra/terraform.tfvars`
- `infra/environments/dev/terraform.tfvars`
- `infra/modules/web_server/main.tf`
- `infra/modules/web_server/outputs.tf`
- `infra/modules/database/main.tf`
- `infra/modules/database/outputs.tf`
- `infra/modules/load_balancer/main.tf`
- `infra/modules/load_balancer/outputs.tf`
- `infra/envs/dev/main.tf`
- `client/pubspec.yaml`
- `client/lib/main.dart`
- `client/lib/domain/entities/order.dart`
- `client/lib/domain/repositories/order_repository.dart`
- `client/lib/domain/usecases/create_order.dart`
- `client/lib/core/network/api_client.dart`
- `client/lib/core/utils/constants.dart`
- `client/android/app/src/main/AndroidManifest.xml`
- `client/lib/presentation/screens/order_screen.dart`
- `client/lib/data/datasources/order_remote_data_source.dart`
- `client/lib/data/repositories/order_repository_impl.dart`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `infra`
- `infra/modules/web_server`
- `infra/modules/database`
- `infra/modules/load_balancer`
- `infra/envs/dev`
- `client`
- `client/lib/presentation/screens`
- `client/lib/presentation/widgets`
- `client/lib/domain/entities`
- `client/lib/domain/repositories`
- `client/lib/domain/usecases`
- `client/lib/data/datasources`
- `client/lib/data/repositories`
- `client/lib/core/network`
- `client/lib/core/utils`

## Verificacion

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd client && flutter pub get && flutter analyze)
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- Cada componente vive en su carpeta: instala y compila dentro de ella, y no muevas archivos entre componentes.
- Respeta los contratos entre componentes (endpoints, topics) tal como estan declarados en el mapa de componentes.
- El patron es **Clean Architecture con separación de capas (presentation, domain, data)**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Senior L2
- Brecha que el reto ataca: Aprovisionar infraestructura con Terraform para la app movil (corrida e2e 20261109213213585), Aprovisiona con Terraform los recursos que consume la aplicacion movil
- Mision: Desplegar la API de la app de pedidos

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
