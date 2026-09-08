# Matriz de acceso — Request API v5

Dos roles exactos: `requester` y `agent`. Sin `admin`.

Completa cada celda con `Sí`, `No`, `Propias` o `Propia y abierta`.
La matriz puede discutirse, pero la implementación converge en la baseline
del taller (lámina Contrato fijo).

| Operación | Anónimo | Requester | Agent |
| --------- | ------: | --------: | ----: |
| `POST /auth/register` | "Si" | "Si" | "Si" |
| `POST /auth/login` | "Si" | "Si" | "Si" |
| `GET /auth/me` | "No" | "Si" | "Si" |
| `GET /requests` | "No" | "propias" | "todas" |
| `GET /requests/:id` | "No" | "propias" | "todas" |
| `GET /requests/:id/history` | "No" | "propias" | "todas" |
| `POST /requests` | "No" | "Si" | "No" |
| Editar título/descripción | "No" | "propias y abierta" | "No" |
| Cambiar prioridad | "No" | "No" | "Si" |
| Cambiar estado | "No" | "No" | "Si" |

## Campos controlados por el servidor

Lista aquí los campos que el cliente JAMÁS puede enviar, en el registro y en
las solicitudes, y qué respuesta exacta produce intentarlo.

## Solicitudes heredadas

¿Quién ve las solicitudes sin propietario (`created_by IS NULL`)? ¿Por qué?
