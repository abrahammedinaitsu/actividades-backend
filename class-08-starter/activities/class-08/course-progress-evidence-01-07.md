# course-progress-evidence-01-07

Paquete de evidencia para el diagnóstico acumulativo 7 en 1.
Generado automáticamente — completa las secciones marcadas con [COMPLETAR] antes de ejecutar el prompt.

## Metadata

* studentId: [COMPLETAR — tu identificador de estudiante, sin datos personales extra]
* promptVersion: ITSU-CHECKPOINT-01-07-1.0
* rubricVersion: BACKEND-01-07-R1
* generatedAt: 2026-09-29T14:29:40.356Z (EXECUTED_NOW)
* repoRoot: actividades-backend
* commit: b76744a (EXECUTED_NOW)
* repositorioRemoto: https://github.com/abrahammedinaitsu/actividades-backend.git (EXECUTED_NOW) — verifica que sea TU repositorio antes de continuar
* modeloUtilizado: [COMPLETAR después de ejecutar el prompt]

### Contexto de git (informativo, EXECUTED_NOW)

El curso se trabaja en computadoras compartidas: el historial local puede
estar incompleto o pertenecer a otra sesión sin que falte trabajo real.
Este contexto NO es evidencia requerida — la evidencia son los archivos
del repositorio remoto del estudiante y sus respuestas. La ausencia de
commits aquí no debe interpretarse como evidencia faltante.

```text
b76744a primera parte terminada
a8c211e feat: implement application structure with error handling, authentication, and request management
439bde2 Initial commit
```

## Evidencia por clase

Los archivos listados existen en el repositorio (FOUND). Un archivo de salida guardado, como validation-evidence.txt, es TEXTO: demuestra que se guardó, no que se ejecutó (NOT_VERIFIED como ejecución).

### Clase 01 — Fundamentos de backend

* NOT_FOUND: ningún artefacto esperado de esta clase

### Clase 02 — HTTP y contratos

* FOUND: request-api-v5-starter/docs/http-contract.md

Extracto de request-api-v5-starter/docs/http-contract.md (redactado automáticamente):

```text
# Contrato HTTP — Request API v5 (solución de referencia)

## Qué cambió respecto de la v4

* Tres endpoints nuevos: `POST /auth/register`, `POST /auth/login`, `GET /auth/me`.
* **Todos los endpoints de `/requests` ahora exigen `Authorization: Bearer <token>`.**
* La conversación de los endpoints existentes conserva su forma, pero cada respuesta
  depende ahora de QUIÉN pregunta (rol y propiedad). Aparece `createdBy` en la
  representación y `changedBy` en el historial.
* Códigos nuevos: `401`, `403` y los códigos de contrato de auth.
* Forma de error invariable: `{ "error": { "code", "message" } }`.

## Actores

Dos roles exactos: `requester` (crea y sigue sus solicitudes) y `agent` (las atiende).
El registro SIEMPRE crea `requester`; la promoción a `agent` es una operación docente
controlada (SQL), nunca un endpoint.

## Matriz de acceso (baseline fija del taller)

| Operación | Anónimo | Requester | Agent |
| --------- | ------: | --------: | ----: |
| `POST /auth/register` | Sí | Sí | Sí |
| `POST /auth/login` | Sí | Sí | Sí |
| `GET /auth/me` | No | Sí | Sí |
| `GET /requests` | No | Propias | Todas |
| `GET /requests/:id` | No | Propia | Todas |
| `GET /requests/:id/history` | No | Propia | Todas |
| `POST /requests` | No | Sí | No |
| Editar título/descripción | No | Propia y abierta | No |
[... 92 líneas más]
```

### Clase 03 — Recursos, estado y reglas

* NOT_FOUND: ningún artefacto esperado de esta clase

### Clase 04 — PostgreSQL y persistencia

* FOUND: class-07-starter/database/migrations/001_create_users.sql
* FOUND: class-07-starter/database/migrations/002_create_requests.sql
* FOUND: class-07-starter/database/migrations/003_create_request_history.sql
* FOUND: class-07-starter/database/migrations/004_add_constraints_and_indexes.sql
* FOUND: class-07-starter/database/migrations/005_fix_history_priority_check.sql
* FOUND: class-07-starter/scripts/seed.js
* FOUND: class-08-starter/database/migrations/001_create_users.sql
* FOUND: class-08-starter/database/migrations/002_create_requests.sql
* FOUND: class-08-starter/database/migrations/003_create_request_history.sql
* FOUND: class-08-starter/database/migrations/004_add_constraints_and_indexes.sql
* FOUND: class-08-starter/database/migrations/005_add_request_assignment.sql
* FOUND: class-08-starter/scripts/seed.js
* … 5 archivo(s) más con el mismo patrón

### Clase 05 — Autenticación y autorización

* FOUND: request-api-v5-starter/activities/class-05/README.md
* FOUND: request-api-v5-starter/activities/class-05/access-matrix.md
* FOUND: request-api-v5-starter/activities/class-05/ai-usage.md
* FOUND: request-api-v5-starter/activities/class-05/auth-contract.md
* FOUND: request-api-v5-starter/activities/class-05/decision-log.md
* FOUND: request-api-v5-starter/activities/class-05/reflection.md
* FOUND: request-api-v5-starter/activities/class-05/threat-cases.md
* FOUND: request-api-v5-starter/activities/class-05/validation-evidence.md — salida guardada, NOT_VERIFIED como ejecución
* FOUND: request-api-v5-starter/scripts/validate-class-05.js

Extracto de request-api-v5-starter/activities/class-05/auth-contract.md (redactado automáticamente):

```text
# Contrato de autenticación — Request API v5

Documenta ANTES de implementar. Para cada endpoint: método, ruta, ¿público o
protegido?, body permitido, respuesta de éxito (código + forma) y CADA error
(código HTTP + `error.code`).

## POST /auth/register 
publico. body permitido: 'email', password' (nada mas.)
 exito: '201 created' -> '{"id", "emial", "role": "requester", "createdAT"}'.
errores:
-'400 VALIDATION_ERROR' - falta email/password o password fuera de 15-128
-'400 SERVER_CONTROLLED_FIELD' - el body trae 'role', 'id', 'passwordhash', 'createdAT'...
-'409 ACCOUNT_CANNOT_BE_CREATED' - email ya registrado (generico, no confirma ecitencia)

## POST /auth/login

## GET /auth/me

## Semántica de errores

¿Cuándo responde tu API `401`? ¿Cuándo `403`? ¿Cuándo `404` aunque el recurso
exista? ¿Cuándo `409`? Escribe el criterio, no solo ejemplos.

```

Extracto de request-api-v5-starter/activities/class-05/validation-evidence.md (redactado automáticamente):

```text
# Evidencia de validación — Clase 05

Pega aquí la salida del validador al cerrar cada estación (SIN secretos: el
validador ya evita imprimirlos, no agregues capturas de tu `.env`).

## stage setup

## stage access-design

## stage register

## stage password

## stage login

## stage authentication

## stage ownership

## stage authorization

## Boss battle (integral)

```

### Clase 06 — Onboarding y pruebas

* FOUND: class-07-starter/scripts/validate-class-06.js
* FOUND: class-08-starter/scripts/validate-class-06.js

### Clase 07 — Diagnóstico y errores

* FOUND: class-07-starter/.gitignore
* FOUND: class-07-starter/README.md
* FOUND: class-07-starter/activities/class-07/README.md
* FOUND: class-07-starter/activities/class-07/incident-report.md
* FOUND: class-07-starter/activities/class-07/validation-evidence.txt — salida guardada, NOT_VERIFIED como ejecución
* FOUND: class-07-starter/database/migrations/001_create_users.sql
* FOUND: class-07-starter/database/migrations/002_create_requests.sql
* FOUND: class-07-starter/database/migrations/003_create_request_history.sql
* FOUND: class-07-starter/database/migrations/004_add_constraints_and_indexes.sql
* FOUND: class-07-starter/database/migrations/005_fix_history_priority_check.sql
* FOUND: class-07-starter/incidents/INC-701-invalid-request-id.md
* FOUND: class-07-starter/incidents/INC-702-invalid-priority.md
* … 53 archivo(s) más con el mismo patrón

Extracto de class-07-starter/activities/class-07/incident-report.md (redactado automáticamente):

```text
# Class 07 incident report

Completa cada sección MIENTRAS investigas. Separa hechos de
interpretaciones: un "creo que" pertenece a Hypotheses, no a Evidence.

## Baseline

Which command confirmed the starting state?

## Incident 701

### Report

(what support said, in one or two lines)

### Reproduction

(the exact request: method, path, user/role, body if any)

### Expected result

### Actual result

(status and body actually received — copy them)

### Hypotheses

(at least two, ordered by probability, each with HOW you would check it)

### Evidence
[... 56 líneas más]
```

Extracto de class-07-starter/activities/class-07/validation-evidence.txt (redactado automáticamente):

```text
Pega aquí la salida REAL y COMPLETA de:

    npm run validate:class-07

Debe incluir las 12 verificaciones con sus secciones (Baseline, Input and
errors, Traceability, Operation), la línea de Cleanup y el FINAL RESULT.

Antes de guardar, revisa que no haya ninguna credencial pegada por error:
ni DATABASE_URL, ni JWT_SECRET, ni tokens. Si aparece algo así,
reemplázalo por [configured].

```

## Estado previo a la clase 8

* Validadores disponibles (clases 1-7): class-07-starter/scripts/validate-class-06.js, class-07-starter/scripts/validate-class-07.js, class-08-starter/scripts/validate-class-06.js, class-08-starter/scripts/validate-class-07.js, request-api-v5-starter/scripts/validate-class-05.js
* Carpetas de pruebas: class-07-starter/test, class-08-starter/test
* Último commit antes del taller: b76744a

## Cuestionario diagnóstico (responde aquí, 3-6 líneas cada una)

Sé específico: cita archivos o rutas concretas de TU proyecto cuando puedas. La extensión no suma.

### Pregunta clase 01 

Describe qué ocurre desde que una petición llega al backend hasta que sale una respuesta y explica por qué el servidor debe permanecer activo.

Respuesta: el servidor recibe la peticion los busca en la base de datos y los envia en formato Json diciendo 200 ok para saber que si los encontro y los envio, el servidor debe permanecer activo en cada momento porque no sabe en que momento el usuario volvera a pedir otra peticion, a la vez ahorra tiempo ya que en apagar y encender el servidor toma tiempo en que el servidor vuelva a conectarse por completo 

### Pregunta clase 02

Elige un endpoint del proyecto y explica cómo método, ruta, body y status forman su contrato.

Respuesta: [COMPLETAR]

### Pregunta clase 03

Explica, usando una solicitud del proyecto, la diferencia entre representación, dato inválido y transición incompatible con el estado actual.

Respuesta: representacion ocurre cuando se envia un dato que no cumples con las reglas de protocolo y lanza un error 400 bad request

dato invalido: ocurre cuando cumple los valores de la solicitud pero no cumple con las reglas  estaticas del dominio como rangos, campos obligatorios, formatos específicos como un email o un valor positivo y lanza un error 422 Unprocessable Entity

Transición Incompatible con el Estado Actual: ocurre cuando la solicitud es impecable pero ya se envio o se elimino esa solicitud y no se puede volver a enviar y lanza un error 409 Conflict

### Pregunta clase 04

Explica la diferencia entre migración, seed y transacción, e indica dónde aparece cada concepto en el proyecto.

Respuesta: migracion: Es un archivo de control de versiones para la estructura de la base de datos que define las instrucciones para modificar la forma de las tablas, columnas, restricciones o índices

seed 

### Pregunta clase 05

Explica la diferencia entre autenticación y autorización y por qué un JWT decodificado todavía debe verificarse.

Respuesta: [COMPLETAR]

### Pregunta clase 06

Elige una prueba del proyecto, identifica preparación, acción y comprobación, y explica qué regresión protege.

Respuesta: [COMPLETAR]

### Pregunta clase 07

Describe un fallo investigado distinguiendo síntoma, hipótesis y causa; luego indica qué señal correspondería a health o readiness.

Respuesta: [COMPLETAR]

---
Nota de seguridad: este paquete fue generado excluyendo .env y redactando
posibles secretos. Revisa una vez más antes de pegarlo en un modelo:
si ves una credencial real, reemplázala por [REDACTED] y avisa al docente.
